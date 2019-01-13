require 'user'

context '#authenticate' do

   let!(:user) { User.create(
     name: 'Magnus',
     username: 'The Crimson King',
     email: 'Magnus@1000sons.com',
     password: 'ilovemagic')
   }
   it "Sign in if username and password are correct" do
     expect(User.authenticate('The Crimson King', 'classicWoW')).to eq(user)
   end
 end
