require 'user'

describe User do

    describe '.create' do
        it 'adds user details to database' do
         user = User.create(username: 'JS_500', name: 'Josh Steadman', password: '12345', email: 'js@mail.com') 
         expect(user.username).to eq 'JS_500'
         expect(user.email).to eq 'js@mail.com'
        end
    end

    describe '.find' do
        it 'finds a user by ID' do
          user = User.create(username: 'JS_500', name: 'Josh Steadman', password: '12345', email: 'js@mail.com')
          result = User.find(user.id)
          p user

          expect(result.id).to eq user.id
          expect(result.email).to eq user.email
        end

        
        it 'returns nil if there is no ID given' do
              expect(User.find(nil)).to eq nil
        end
        
    end

   

end