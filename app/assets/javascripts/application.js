// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require moment
//= require fullcalendar
//= require_tree .

$(function () {
  // 画面遷移を検知
  $(document).on('turbolinks:load', function () {
    // lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
    if ($('#calendar').length) {
      function eventCalendar() {
        return $('#calendar').fullCalendar({
        });
      };
      function clearCalendar() {
        $('#calendar').html('');
      };

      $(document).on('turbolinks:load', function () {
        eventCalendar();
      });
      $(document).on('turbolinks:before-cache', clearCalendar);

      $('#calendar').fullCalendar({
        events: '/works.json',
        //カレンダー上部を年月で表示させる
        titleFormat: 'YYYY年 M月',
        //曜日を日本語表示
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        //ボタンのレイアウト
        header: {
          left: '',
          center: 'title',
          right: 'prev,next'
        },
        buttonText: {
          prev: '前',
          next: '次',
          prevYear: '前年',
          nextYear: '翌年',
          today: '今日',
          month: '月',
          week: '週',
          day: '日'
        },
        //イベントの色を変える
        eventColor: '#63ceef',
        //イベントの文字色を変える
        eventTextColor: '#000000',

        // 日付をクリックした際のイベント
        // workの新規投稿画面に遷移したいが、現状リクエストは送信できているが、画面が描画されない
        // dayClick: function (start, end, jsEvent, view) {
          // //クリックした日付情報を取得
          // const year = moment(start).year();
          // const month = moment(start).month()+1; //1月が0のため+1する
          // const day = moment(start).date();
          //イベント登録のためnewアクションを発火
          // $.ajax({
          //   type: 'GET',
          //   url: '/works/new',
          //   dataType: "html"
            // 成功処理
          // }).done(function (res) {
            // コンソールログには描画したいhtmlが表示される。これを実際に描画する
            // console.log(res)
            //イベント登録用のhtmlを作成
            // $('.modal-body').html(res);
            // //イベント登録フォームの日付をクリックした日付とする
            // $('#event_start_time_1i').val(year);
            // $('#event_start_time_2i').val(month);
            // $('#event_start_time_3i').val(day);
            //イベント登録フォームのモーダル表示
            // $('#modal').modal();
            // 失敗処理
        //   }).fail(function (result) {
        //     alert('エラーが発生しました。運営に問い合わせてください。')
        //   });
        // },

      });
    }
  });
});

// dayClick: function(date, jsEvent, view) {
//   //クリックした日付が取れるよ
//   alert('Clicked on: ' + date.format());
// },

// dayClick: function(date, allDay, jsEvent, view) {
//   /* 引数
//   ・date(slotの依存する日付)
//   ・allDay(全日をクリックしたかどうか全日の場合はtrue)
//   ・jsEvent(座標などjsの情報)
//   ・view(カレンダータイトルや表示モードの情報)
//   */
//   },

// ここをテスト中
// dayClick: function (start, end, jsEvent, view) {
// $.get("/works/new",
//     {"cd":"100", "name":"Taro"},
//     function(dt){
//       $().html(dt);
// });
// $.ajax({
//   type: 'GET',
//   url: '/works/new',
//   dataType: "html"
// });
// //クリックした日付情報を取得
// const year = moment(start).year();
// const month = moment(start).month()+1; //1月が0のため+1する
// const day = moment(start).date();
// //イベント登録のためnewアクションを発火
// $.ajax({
//   type: 'GET',
//   url: '/works/new',
//   dataType: "html"
// });


// リクエストの送信はされるが、画面が変わらない
// dayClick: function (start, end, jsEvent, view) {
//   $.get("/works/new")
// }

