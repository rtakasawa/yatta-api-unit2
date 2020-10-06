class ApplicationMailer < ActionMailer::Base
  # メールのfromヘッダーを指定
  default from: 'from@example.com'
  # レイアウトを指定
  layout 'mailer'
end
