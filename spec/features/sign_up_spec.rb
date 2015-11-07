require 'spec_helper'

 feature 'Signing up' do
 	scenario 'I can sign up as a new user' do
 		visit('/sign_up')
	  fill_in(:email, with: 'me@me.com')
	  fill_in(:password, with: 123)
	  click_button 'Sign up'
 		#expect { sign_up }.to change(User, :count).by(1)
    #expect(page.status_code).to eq(200)
    #expect(page).to have_content('Welcome, me@me.com')
    #expect(User.first.email).to eq('me@me.com')
 	end
 end