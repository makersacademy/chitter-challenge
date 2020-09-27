require 'data_helper'
require 'user'

describe User do
    describe '#create' do
        it 'Create a new user' do
            user = User.create('Johnny', 'test@test.com', 'hello123')

            persisted_data = persisted_data(:user_list, user.id)

            expect(user.id).to eq(persisted_data.first['id'])
            expect(user.username).to eq('Johnny')
            expect(user.email).to eq('test@test.com')
        end
    end

    
end
