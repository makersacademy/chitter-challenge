require 'capybara/rspec'

feature 'load login' do
	scenario "User loads login" do

		visit '/'
		expect(page).to have_content 'Welcome'
	end
	scenario "User logs in" do
		visit '/'
		fill_in('password', :with => 'rhys@rhys.com')
		fill_in('password', :with => 'test')

		click_button('submit')

		expect(page).to have_content "Rhys"
	end
end