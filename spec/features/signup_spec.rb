require 'spec_helper'

feature 'signing up' do 
	scenario 'sign up' do
		visit '/user/new'
		fill_in 'name',			with: 'Edu'
		fill_in 'mailup',			with: 'hedu.delgado@gmail.com'
		fill_in 'passwordup',		with: 'secret'
		fill_in 'password_confirmation',	with: 'secret'
		click_button('Sign up')	
		expect(page).to have_content('Welcome Edu')
		expect(User.first.name). to eq('Edu')
	end
end
