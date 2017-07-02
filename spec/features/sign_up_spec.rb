require 'web_helpers'

feature 'sign up' do
  scenario 'create user account' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    user = User.first 
    expect(user.email).to eq 'randomail@gmail.com'
  end  
end 
