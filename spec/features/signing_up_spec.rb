require 'spec_helper'

feature 'User can sign up for a Chitter account' do
  let!(:user) do
    User.create(email: 'agata@google.com',
                password: 'mypassword1', username: 'AgataGo')
  end

  scenario 'User enters email, password and username' do
 		sign_up(email: user.email, password: user.password, username: user.username)
 		expect(page).to have_content("Welcome, #{user.email}!")
    expect(User.first.eamil).to eq('agata@google.com')
  end


  def sign_up(email:, password:, username:)
 		visit ('/')
    click_button('Register')
 	  fill_in :email, with: email
 	  fill_in :password, with: password
 	  fill_in :username, with: username
 	  click_button('Sign up')
 	end
end
