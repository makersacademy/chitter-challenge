require 'spec_helper'

 RSpec.feature 'user account management' do
   scenario 'a new user can sign up' do
     expect {sign_up}.to change(User, :count).by(1)
     expect(User.first.email).to eq('ed@balls.com')
   end
end
