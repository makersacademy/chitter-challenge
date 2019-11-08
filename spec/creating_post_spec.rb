require 'capybara/rspec'

feature 'user can create a new post' do
	scenario "User logs in" do
		visit '/'
		fill_in('password', :with => 'rhys@rhys.com')
		fill_in('password', :with => 'test')

		click_button('submit')

		visit '/create'

		fill_in('post', :with => 'hello from tests')

		click_button('submit')

		visit '/view'

		expect(page).to have_content 'hello from tests'

	end
end