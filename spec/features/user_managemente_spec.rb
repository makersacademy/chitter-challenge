require 'spec_helper'

feature 'User sign up' do
	
	scenario 'I can sign up as a new user' do
		user = User.create(email: 'some@email.com', username: 'someone', password: 'something', password_confirmation: 'something')
		expect { sign_up(user) }.to change(User, :count).by(1)
		expect(page).to have_content('Welcome to Chitter!')
		expect(User.first.username).to eq('someone')
	end 

	def sign_up(user)
		visit '/user/new'
		expect(page.status_code).to eq(200)
		fill_in :email,    with: user.email
		fill_in :username, with: user.username
		fill_in :password, with: user.password
		fill_in :password_confirmation, with: user.password_confirmation
		click_button 'Sign up'
	end
end