require 'spec_helper'

require_relative 'web_helper'

feature 'User signs out!' do 
	before(:each) do 
		User.create(name: 'Edu',
			mail: 'hedu.delgado',
			password: 'secretin',
			password_confirmation: 'secretin')
	end

	scenario 'being sign in' do 
		sign_in(mail: 'hedu.delgado',
			password: 'secretin')
		click_button 'Sign out'
		expect(page).to have_content('See you sOon!')
		expect(page).not_to have_content('welcome, Edu')
	end

end