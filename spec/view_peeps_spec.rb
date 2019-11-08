require 'capybara/rspec'

feature 'load peeps' do
	scenario "user can see peeps" do
		visit '/'
		fill_in('password', :with => 'rhys@rhys.com')
		fill_in('password', :with => 'test')

		click_button('submit')

		expect(page).to have_content 'Test Peep'
	end

end