require 'spec_helper'

feature 'User Logs in' do 
	
	let(:user) do 
		User.create(name:'Edu',
			mail: 'hedu.delgado@gmail.com',
			password: 'secreto',
			password_confirmation: 'secreto')
	end

	scenario 'with right info' do 
		sign_in(mail: user.mail,
			password: user.password)
		expect(page).to have_content "Welcome #{user.name}"
	end

	def sign_in(mail:,password:)
		visit '/sessions/log-in'
		fill_in :mail,    with: mail
		fill_in :password, with: password
		click_button 'Sign in'
	end
end