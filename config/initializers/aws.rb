ActionMailer::Base.add_delivery_method(
  :ses,
  AWS::SES::Base,
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  # region: 'ap-northeast-1'
  # server: 'email-smtp.ap-northeast-1.amazonaws.com'
  server: 'email.ap-northeast-1.amazonaws.com'
)
