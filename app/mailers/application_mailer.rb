class ApplicationMailer < ActionMailer::Base
  # メールのfromヘッダーを指定
  default from: 'Yatta-app <info@yatta-app.com>'
  # レイアウトを指定
  layout 'mailer'
end
