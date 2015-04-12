require 'spec_helper'
feature 'User signs up' do
	scenario 'a new user signing up to chitter' do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content('Welcome, caron@caronstace.co.uk')
		expect(User.first.email).to eq('caron@caronstace.co.uk')
	end

	def sign_up (email = 'caron@caronstace.co.uk',
              password = 'cats')
		visit 'new'
		expect(page.status_code).to eq(200)
		fill_in :email, with: email
		fill_in :password, with: password
		click_button 'Sign up' 
	end
end