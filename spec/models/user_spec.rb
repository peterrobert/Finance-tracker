# rubocop:disable Lint/UselessAssignment

require 'rails_helper'

RSpec.describe User, type: :model do
  test_user = User.create!(name: 'peter robert', email: 'h@example.com', password: 'hsjoarty067')

  it 'should fail to create account without name' do
    ev = User.create(email: 'b@example.com', password: 'hsjoarty067')
    expect(ev.persisted?).to eql(false)
  end

  it 'should fail to create account without email' do
    ev = User.create(name: 'peter robert', password: 'hsjoarty067')
    expect(ev.persisted?).to eql(false)
  end

  it 'should fail to create account without password' do
    ev = User.create(name: 'peter robert', email: 'e@example.com')
    expect(ev.persisted?).to eql(false)
  end
end

# rubocop:enable Lint/UselessAssignment
