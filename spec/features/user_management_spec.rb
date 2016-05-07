require 'spec_helper'

feature 'User management' do
	scenario 'user can sign up' do
		expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Omar')
    expect(User.first.email).to eq('omar@example.com')
	end	
end