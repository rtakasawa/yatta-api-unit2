require 'rails_helper'
require 'devise'

RSpec.describe '教材管理機能', type: :model do
  before do
    User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
    User.create(id: 2, name: "sample2", email: "sample2@example.com", password: "0000000")
  end

  it "titleが空ならバリデーションが通らない" do
    material = Material.new( title:"",
                             author: "test_author1",
                             category: "book",
                             path: "http://example.com",
                             note: "test_note1",
                             user_id: 1 )
    expect(material).not_to be_valid
  end
  it "categoryが空ならバリデーションが通らない" do
    material = Material.new( title:"test_title",
                             author: "test_author1",
                             category: "",
                             path: "http://example.com",
                             note: "test_note1",
                             user_id: 1 )
    expect(material).not_to be_valid
  end
  it "titleとcategoryが記載されていればバリデーションが通る" do
    material = Material.new( title:"test_title",
                             author: "1",
                             category: "book",
                             path: "",
                             note: "",
                             user_id: 1 )
    expect(material).to be_valid
  end
end