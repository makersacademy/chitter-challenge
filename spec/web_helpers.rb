require 'spec_helper'

module SessionHelpers

	def sign_in(email:, password:)
	  visit '/sign_in'
	  fill_in 'email', with: email
	  fill_in :password, with: password
	  click_button 'Sign in'
	end

	def sign_up(email: 'me@me.com',
								name: 'me',
								nickname: 'mynickname',
	              password: '123',
	              password_confirmation: '123')
	  visit('/sign_up')
	  expect(page.status_code).to eq(200)
	  fill_in(:email, with: email)
	  fill_in(:name, with: name)
	  fill_in(:nickname, with: nickname)
	  fill_in(:password, with: password)
	  fill_in(:password_confirmation, with: password_confirmation)
	  click_button 'Sign up'
	end

end