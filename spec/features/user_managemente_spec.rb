require 'spec_helper'

feature 'User sign up' do
	
	scenario 'I can sign up as a new user' do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content('Welcome to Chitter!')
		expect(User.first.username).to eq('someone')
	end 

	def sign_up(email: 'some@email.com', username: 'someone', password: 'something', password_confirmation: 'something')
		visit '/user/new'
		expect(page.status_code).to eq(200)
		fill_in :email,    with: email
		fill_in :username, with: username
		fill_in :password, with: password
		fill_in :password_confirmation, with: password_confirmation
		click_button 'Sign up'
	end
end