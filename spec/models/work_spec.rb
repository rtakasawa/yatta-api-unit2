require 'rails_helper'

RSpec.describe '学習管理機能', type: :model do
  before do
    User.create(id: 1, name: 'sample', email: 'sample@example.com', password: '0000000')
    Material.create(id: 1, title: 'test_title1', category: 'book', path: 'http://example1.com', note: 'test_note1', status: 'learning', user_id: 1)
  end

  it 'startが空ならバリデーションが通らない' do
    work = Work.new(start: '',
                    finish: '1-1',
                    content: '難しかった',
                    do_on: Time.zone.today,
                    status: 'learning',
                    material_id: 1)
    expect(work).not_to be_valid
  end
  it 'finishが空ならバリデーションが通らない' do
    work = Work.new(start: '1-1',
                    finish: '',
                    content: '難しかった',
                    do_on: Time.zone.today,
                    status: 'learning',
                    material_id: 1)
    expect(work).not_to be_valid
  end
  it 'do_onが空ならバリデーションが通らない' do
    work = Work.new(start: '1-0',
                    finish: '1-1',
                    content: '難しかった',
                    do_on: '',
                    status: 'learning',
                    material_id: 1)
    expect(work).not_to be_valid
  end
  it 'do_onが明日以降の日付ならバリデーションが通らない' do
    work = Work.new(start: '1-0',
                    finish: '1-1',
                    content: '難しかった',
                    do_on: Date.tomorrow,
                    status: 'learning',
                    material_id: 1)
    expect(work).not_to be_valid
  end
  it 'startとfinishとdo_onが記載されていればバリデーションが通る' do
    work = Work.new(start: '1-0',
                    finish: '1-1',
                    content: '',
                    do_on: Time.zone.today,
                    status: 'learning',
                    material_id: 1)
    expect(work).to be_valid
  end
  it 'statusが空ならバリデーションが通らない' do
    work = Work.new(start: '1-0',
                    finish: '1-1',
                    content: '難しかった',
                    do_on: Time.zone.today,
                    status: '',
                    material_id: 1)
    expect(work).not_to be_valid
  end
  it 'Work.createした際のstatusの初期値はlearningになる' do
    work = Work.create(start: '1-0',
                    finish: '1-1',
                    content: '難しかった',
                    do_on: Time.zone.today,
                    material_id: 1)
    expect(work.status).to eq('learning')
  end
end
