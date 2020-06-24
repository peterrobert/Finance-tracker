require 'rails_helper'

RSpec.describe Group, type: :model do

        test_user = User.create!(name: 'peter robert', email: 'b@example.com', password: 'hsjoarty067')
        test_group = Group.create!(name: 'test_group', icon: 'https://testicons.com/testicon.png', user_id:test_user.id)
       

      it 'should fail to create a group without name' do
        ev = Group.create(icon: 'https://testicons.com/testicon.png')
        expect(ev.persisted?).to eql(false)
      end

      it 'should fail to create a group user' do
        ev = Group.create(name: 'test_group',icon: 'https://testicons.com/testicon.png')
        expect(ev.persisted?).to eql(false)
      end
     
      it 'should create group' do
        ev = Group.create(name: 'test_group',icon: 'https://testicons.com/testicon.png', user_id:test_user.id)
        expect(ev.persisted?).to eql(true)
      end
      
end