require "rails_helper"

RSpec.describe WorkPolicy, type: :policy do
  subject { described_class }
  let(:user) { FactoryBot.create(:user) }

  let(:learning_material) { FactoryBot.create(:material, user: user) }
  let(:complete_material) { FactoryBot.create(:material, id: 2, status: 'complete', user: user) }

  let(:learning_work) { FactoryBot.create(:work, material: learning_material) }
  let(:complete_work) { FactoryBot.create(:work, id: 2, status: 'complete', material: complete_material) }
  let(:work_only_material_complete) { FactoryBot.create(:work, id: 3, material: complete_material) }
  let(:work_only_work_complete) { FactoryBot.create(:work, id: 4, status: 'complete', material: learning_material) }

  permissions :create?, :edit?, :update?, :status_learning? do
    it "学習中の時に許可" do
      expect(subject).to permit(user, learning_work)
    end
    it "学習完了の時に不許可" do
      expect(subject).not_to permit(user, complete_work)
      expect(subject).not_to permit(user, work_only_material_complete)
      expect(subject).not_to permit(user, work_only_work_complete)
    end
  end
  permissions :new? do
    it "materialが学習中の時に許可" do
      expect(subject).to permit(user, learning_material)
    end
    it "materialが学習完了の時に不許可" do
      expect(subject).not_to permit(user, complete_material)
    end
  end
end
