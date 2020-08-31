require 'user'

describe User do

    describe '.create' do
        it 'adds user details to database' do
         user = User.create(username: 'JS_500', name: 'Josh Steadman', password: '12345', email: 'js@mail.com') 
         expect(user.first.username).to eq 'JS_500'
         expect(user.first.email).to eq 'js@mail.com'
        end
    end

    describe '.current_user' do
        it 'returns user that is signed in' do
            user = User.create(username: 'JS_500', name: 'Josh Steadman', password: '12345', email: 'js@mail.com')  
            user2 = User.create(username: 'LS_200', name: 'Lewis Steadman', password: '123456', email: 'ls@mail.com') 
            expect(User.current_user).to eq user2.first.username
        end
    end
end