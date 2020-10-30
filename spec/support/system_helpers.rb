module SystemHelpers
  def test_user_create(factories_user)
    user = FactoryBot.create(factories_user)
    visit user_confirmation_path(confirmation_token: user.confirmation_token)
  end
end
