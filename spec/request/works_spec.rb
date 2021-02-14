require 'rails_helper'

RSpec.describe 'Works', type: :request do
  let(:user) { FactoryBot.create(:user) }

  let(:learning_material) { FactoryBot.create(:material, user: user) }
  let(:complete_material) { FactoryBot.create(:material, id: 2, status: 'complete', user: user) }

  let(:learning_work) { FactoryBot.create(:work, material: learning_material) }
  let(:complete_work) { FactoryBot.create(:work, id: 2, status: 'complete', material: complete_material) }
  let(:work_only_material_complete) { FactoryBot.create(:work, id: 3, material: complete_material) }
  let(:work_only_work_complete) { FactoryBot.create(:work, id: 4, status: 'complete', material: learning_material) }

  let(:learning_params) { FactoryBot.attributes_for(:test_work, status:'learning', material_id: learning_material.id) }
  let(:complete_params) { FactoryBot.attributes_for(:test_work, status:'complete', material_id: complete_material.id) }
  let(:only_material_complete_params) { FactoryBot.attributes_for(:test_work, status:'learning', material_id: complete_material.id) }
  let(:only_work_complete_params) { FactoryBot.attributes_for(:test_work, status:'complete', material_id: learning_material.id) }

  describe 'GET /works/new' do
    before do
      user.confirm # devise:メール認証機能(サインインの前に認証必要)
      sign_in(user) # devise:認証処理
    end
    it '学習中の場合、リクエストは成功する' do
      get new_work_path(material_id: learning_material)
      expect(response.status).to eq 200
    end
    it '学習完了の場合、リクエストは成功しない' do
      get new_work_path(material_id: complete_material)
      expect(response.status).to eq 500
    end
  end

  describe 'POST /works(createアクション)' do
    before do
      user.confirm
      sign_in(user)
    end
    it '学習中の場合、リクエストは成功する' do
      post works_path, params: { work: learning_params }
      expect(response.status).to eq 302
    end
    it 'material,workどちらも学習完了の場合、リクエストは成功しない' do
      post works_path, params: { work: complete_params }
      expect(response.status).to eq 500
    end
    it 'materialのみ学習完了の場合、リクエストは成功しない' do
      post works_path, params: { work: only_material_complete_params }
      expect(response.status).to eq 500
    end
    it 'workのみ学習完了の場合、リクエストは成功しない' do
      post works_path, params: { work: only_work_complete_params }
      expect(response.status).to eq 500
    end
  end

  describe 'GET /works/:id/edit' do
    before do
      user.confirm
      sign_in(user)
    end
    it '学習中の場合、リクエストは成功する' do
      get edit_work_path(learning_work)
      expect(response.status).to eq 200
    end
    it 'material,workどちらも学習完了の場合、リクエストは成功しない' do
      get edit_work_path(complete_work)
      expect(response.status).to eq 500
    end
    it 'materialのみ学習完了の場合、リクエストは成功しない' do
      get edit_work_path(work_only_material_complete)
      expect(response.status).to eq 500
    end
    it 'workのみ学習完了の場合、リクエストは成功しない' do
      get edit_work_path(work_only_work_complete)
      expect(response.status).to eq 500
    end
  end

  describe 'PUT /works/:id(updateアクション)' do
    before do
      user.confirm
      sign_in(user)
      @params = { work: FactoryBot.attributes_for(:work) }
    end
    it '学習中の場合、リクエストは成功する' do
      put work_path(learning_work), params: @params
      expect(response.status).to eq 302
    end
    it 'material,workどちらも学習完了の場合、リクエストは成功しない' do
      put work_path(complete_work), params: @params
      expect(response.status).to eq 500
    end
    it 'materialのみ学習完了の場合、リクエストは成功しない' do
      put work_path(work_only_material_complete), params: @params
      expect(response.status).to eq 500
    end
    it 'workのみ学習完了の場合、リクエストは成功しない' do
      put work_path(work_only_work_complete), params: @params
      expect(response.status).to eq 500
    end
  end
end
