require 'spec_helper'

 feature 'Signing up' do
 	scenario 'I can sign up as a new user' do
 		visit('/sign_up')
 		fill_in(:email, with: email)
  	fill_in(:password, with: password)
  	click_button 'Sign up'
 	end
 end