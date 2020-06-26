# rubocop:disable Lint/UselessAssignment

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  test_user = User.create!(name: 'peter robert', email: 'pan@example.com', password: 'hsjoarty067')
  test_group = test_user.groups.create!(name: 'test_group', icon: 'https://testicons.com/testicon.png')
  test_transaction = Transaction.create!(name: 'test_transaction', amount: 100, user_id: test_user.id, group_id: test_group.id)

  it 'should fail to create a transaction without amount' do
    ev = Transaction.create(name: 'test event')
    expect(ev.persisted?).to eql(false)
  end

  it 'should fail to create a transaction without name' do
    ev = Transaction.create(amount: 200)
    expect(ev.persisted?).to eql(false)
  end

  it 'should fail to create a transaction without user' do
    ev = Transaction.create(name: 'test event', amount: 100, group_id: test_group.id)
    expect(ev.persisted?).to eql(false)
  end

  it 'should be saved with all users' do
    ev = Transaction.create(name: 'test event', amount: 100, user_id: test_user.id, group_id: test_group.id)
    expect(ev.persisted?).to eql(true)
  end
end

# rubocop:enable Lint/UselessAssignment
