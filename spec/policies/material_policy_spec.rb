require "rails_helper"

RSpec.describe MaterialPolicy, type: :policy do
  subject { described_class }
  let(:user) { FactoryBot.create(:user) }
  let(:learning_material) { FactoryBot.create(:material, user: user) }
  let(:complete_material) { FactoryBot.create(:material, id: 2, status: 'complete', user: user) }

  permissions :new?, :edit?, :update?, :change_complete? do
    it "学習中の時に許可" do
      expect(subject).to permit(user, learning_material)
    end
    it "学習完了の時に不許可" do
      expect(subject).not_to permit(user, complete_material)
    end
  end

  permissions :change_learning? do
    it "学習中の時に不許可" do
      expect(subject).not_to permit(user, learning_material)
    end
    it "学習完了の時に許可" do
      expect(subject).to permit(user, complete_material)
    end
  end
end
