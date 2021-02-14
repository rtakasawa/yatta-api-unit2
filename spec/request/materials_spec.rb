require 'rails_helper'

RSpec.describe 'Materials', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:learning_material) { FactoryBot.create(:material, user: user) }
  let(:complete_material) { FactoryBot.create(:material, id: 2, status: 'complete', user: user) }

  describe 'GET /materials/:id/edit' do
    before do
      user.confirm # devise:メール認証機能(サインインの前に認証必要)
      sign_in(user) # devise:認証処理
    end
    it '学習中の場合、リクエストは成功する' do
      get edit_material_path(learning_material)
      expect(response.status).to eq 200
    end
    it '学習完了の場合、リクエストは成功しない' do
      get edit_material_path(complete_material)
      expect(response.status).to eq 500
    end
  end

  describe 'PUT /materials/:id(updateアクション)' do
    before do
      user.confirm
      sign_in(user)
      @params = { material: FactoryBot.attributes_for(:material) }
    end
    it '学習中の場合、リクエストは成功する' do
      put material_path(learning_material), params: @params
      expect(response.status).to eq 302 # リダイレクトするため302になる
    end
    it '学習完了の場合、リクエストは成功しない' do
      put material_path(complete_material), params: @params
      expect(response.status).to eq 500
    end
  end

  describe 'PUT /materials/:id/change_complete' do
    before do
      user.confirm
      sign_in(user)
      @params = { material: FactoryBot.attributes_for(:material) }
    end
    it '学習中の場合、リクエストは成功する' do
      put change_complete_material_path(learning_material), params: @params
      expect(response.status).to eq 302
    end
    it '学習完了の場合、リクエストは成功しない' do
      put change_complete_material_path(complete_material), params: @params
      expect(response.status).to eq 500
    end
  end

  describe 'PUT /materials/:id/change_learning' do
    before do
      user.confirm
      sign_in(user)
      @params = { material: FactoryBot.attributes_for(:material) }
    end
    it '学習中の場合、リクエストは成功しない' do
      put change_learning_material_path(learning_material), params: @params
      expect(response.status).to eq 500
    end
    it '学習完了の場合、リクエストは成功する' do
      put change_learning_material_path(complete_material), params: @params
      expect(response.status).to eq 302
    end
  end
end
