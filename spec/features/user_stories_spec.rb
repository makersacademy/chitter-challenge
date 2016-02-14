# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
require 'spec_helper'
require 'web_helper'


feature "Ability to sign up" do
	scenario "New users can travel to homepage and sign up" do
		expect { sign_up }.to change(User, :count).by(1)
		expect(User.first.email).to eq('ric9176@hotmail.com')
		expect(page).to have_content('Welcome, ric9176')
	end

end
