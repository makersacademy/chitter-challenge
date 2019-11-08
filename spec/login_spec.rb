require 'capybara/rspec'

feature 'load login' do
	scenario "User loads login" do

		visit '/'
		expect(page).to have_content 'Welcome'
	end
end