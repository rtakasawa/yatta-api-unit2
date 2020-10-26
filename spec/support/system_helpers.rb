module SystemHelpers
  def test_user_create
    user = FactoryBot.create(:user)
    visit user_confirmation_path(confirmation_token: user.confirmation_token)
  end
end