var QiitaOAuth = (function() {
  var obj = function(){};
  obj.prototype = {
    init: function() {
      // 認証向けのパラメータ
      this.authURL = 'https://qiita.com/api/v2/oauth/authorize';   // 認証用URL
      this.clientID = APP_CLIENT_ID;                               // Client ID
      this.clientSecret = APP_CLIENT_SECRET;                       // Client Secret
      this.redirectURL = APP_REDIRECT_URL;             // 認可時のリダイレクト先のURL
      this.scope = APP_PERMISSION_SCOPE;                       // アクセス範囲
      this.state = SecureRandom.alphanumeric                             // 認可時に正当性を確認するための値

      this.cb = undefined;
    },
    login: function(successCallback) {
      // 認可画面を開く
      var url = this.getAuthURL();
      this.cb = window.open(url, "_blank", 'location=no,toolbar=no,clearcache=yes,clearsessioncache=yes');
      this.loginSuccess = successCallback;    // 認可が完了した時に呼ばれる関数
      this.redirectParams = undefined;        // アクセストークンを取得するために必要なパラメータ

      var self = this;
      // アプリを認可したイベントを捕捉するため、ページ読み込み開始のイベントを捕捉するように設定
      self.cb.addEventListener('loadstart', function(e) {
        var loc = e.url;    // 読み込みを開始したURL
        // リダイレクトURLへ飛んだことを確認する
        if (loc.indexOf(self.redirectURL) != -1) {
          // パラメータ取得
          var params = getQueryParams(loc);
          // stateの整合性を確認
          if (params['state'] != self.state) {
            alert("not match state parameter.");
            return;
          }
          self.cb.close();
          self.redirectParams = {
            'client_id': self.clientID,
            'client_secret': self.clientSecret,
            'code': params['code']
          };
          self.loginSuccess(self.redirectParams);
        }
      });
    },
    // 認証用URLの作成
    getAuthURL: function() {
      var url;
      url = this.authURL + "?" + $.param({
        client_id: this.clientID,
        scope: this.scope,
        state: this.state
      });
      return url;
    }
  };
  return obj;
})();


// URLからパラメータを取得する関数
function getQueryParams(url)
{
  var params = {};
  var queryStart = url.indexOf('?');

  // パラメータが存在しない場合
  if (queryStart == -1) { return params; }

  var query = url.substring(queryStart + 1);
  var p = query.split('&');

  // パラメータを取得
  for (var i = 0; i < p.length; ++i) {
    var elm = p[i].split('=');
    var key = decodeURIComponent(elm[0]);
    var value = decodeURIComponent(elm[1]);
    params[key] = value;
  }

  return params;
}

// アプリが認可されたときに呼ばれる、アクセストークンを取得する関数
function onOAuthSuccess(params)
{
  $.ajax({
    url: 'https://qiita.com/api/v2/access_tokens',
    type: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    dataType: 'json',
    data: JSON.stringify(params),
    success: function(res) {
      // 取得成功
      getAuthUser(res['token']);
    },
    error: function(e) {
      // 取得失敗
      alert("Failed to get access token");
    }
  });
}

// アプリを認可したユーザを取得する関数
function getAuthUser(authToken)
{
  $.ajax({
    url: 'https://qiita.com/api/v2/authenticated_user',
    type: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + authToken,   // 取得したアクセストークンを指定
    },
    dataType: 'json',
    success: function(res) {
      // 取得成功
      authUser = res['id'];
    },
    error: function(e) {
      // 取得失敗
      alert("Failed to get authenticated user ID");
    }
  });
}

var qoa = new QiitaOAuth();
qoa.init();
qoa.login(onOAuthSuccess);