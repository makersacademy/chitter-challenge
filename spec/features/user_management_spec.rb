require 'spec_helper'

feature feature 'signing up' do 
	scenario 'requires a matching passwords' do 
		expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
	end

	def sign_up(name: 'Edu', email: 'hedu.delgado@gmail.com', password: '12345', password_confirmation: '12345' )
		visit '/user/new'
		fill_in :name,			with: name
		fill_in :mailup,			with: email
		fill_in :passwordup,		with: password
		fill_in :password_confirmation, with: password_confirmation
		click_button('Sign up')	
	end
end