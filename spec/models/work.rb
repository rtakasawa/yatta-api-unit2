require 'rails_helper'

RSpec.describe '学習管理機能', type: :model do
  before do
    User.create(id: 1, name: "sample", email: "sample@example.com", password: "0000000")
    Material.create( id: 1, title:"test_title1", author: "test_author1", category: "book", path: "http://example1.com", note: "test_note1", user_id: 1 )
  end

  it "startが空ならバリデーションが通らない" do
    work = Work.new( start:"",
                     finish: "1-1",
                     content: "難しかった",
                     status: "incomplete",
                     material_id: 1 )
    expect(work).not_to be_valid
  end
  it "finishが空ならバリデーションが通らない" do
    work = Work.new( start:"1-1",
                     finish: "",
                     content: "難しかった",
                     status: "incomplete",
                     material_id: 1 )
    expect(work).not_to be_valid
  end
  it "statusが空ならバリデーションが通らない" do
    work = Work.new( start:"1-0",
                     finish: "1-1",
                     content: "難しかった",
                     status: "",
                     material_id: 1 )
    expect(work).not_to be_valid
  end
  it "startとfinishとstatusが記載されていればバリデーションが通る" do
    work = Work.new( start:"1-0",
                     finish: "1-1",
                     content: "",
                     status: "incomplete",
                     material_id: 1 )
    expect(work).to be_valid
  end
end