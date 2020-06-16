require 'rails_helper'

RSpec.describe '教材管理機能', type: :model do
  before do
    User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
    User.create(id: 2, name: "sample2", email: "sample2@example.com", password: "0000000")
  end

  it "titleが空ならバリデーションが通らない" do
    material = Material.new( title:"",
                             category: "book",
                             path: "http://example.com",
                             note: "test_note1",
                             status: "learning",
                             user_id: 1 )
    expect(material).not_to be_valid
  end
  it "categoryが空ならバリデーションが通らない" do
    material = Material.new( title:"test1",
                             category: "",
                             path: "http://example.com",
                             note: "test_note1",
                             status: "learning",
                             user_id: 1 )
    expect(material).not_to be_valid
  end
  it "pathが不規則な値ならバリデーションが通らない" do
    material = Material.new( title:"test1",
                             category: "book",
                             path: "example",
                             note: "test_note1",
                             status: "learning",
                             user_id: 1 )
    expect(material).not_to be_valid
  end
  it "pathが空の場合はバリデーションが通る" do
    material = Material.new( title:"test1",
                             category: "book",
                             path: "",
                             note: "test_note1",
                             status: "learning",
                             user_id: 1 )
    expect(material).to be_valid
  end
  it "statusが空ならバリデーションが通らない" do
    material = Material.new( title:"test1",
                             category: "book",
                             path: "http://example.com",
                             note: "test_note1",
                             status: "",
                             user_id: 1 )
    expect(material).not_to be_valid
  end
  it "title、category、statusが記載されていればバリデーションが通る" do
    material = Material.new( title:"test1",
                             category: "book",
                             path: "",
                             note: "",
                             status: "learning",
                             user_id: 1 )
    expect(material).to be_valid
  end
  it 'material削除時に関連付けられたworkが削除されること' do
    material = FactoryBot.create(:material,user_id:1)
    FactoryBot.create(:work,material_id:1)
    expect { material.destroy }.to change { Work.count }.by(-1)
  end
end