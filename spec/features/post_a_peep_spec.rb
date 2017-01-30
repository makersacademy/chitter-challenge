require 'spec_helper'

feature 'Post a peep' do

	scenario 'Non user cannot post a peep' do
		visit('/peep')
		fill_in('peep_content', with: "Happy birthday to the ground")
		click_button('Post')
		expect(page).to_not have_content("Happy birthday to the ground")
	end

before(:each) do

end

	scenario 'Logged in user posting a peep' do
		User.create(username: "mabel",email: "mabel@example.com",password: "123", password_confirmation: "123", name: "Mabel")
		visit('/')
		click_link("Log In")
		fill_in('email', with:'mabel@example.com')
		fill_in('password', with: '123')
		click_button("Log In")
		click_on("peep")
		fill_in('peep_content', with: "Happy birthday to the ground!")
		click_button('Post')
		within "li" do
		expect(page).to have_content("Happy birthday to the ground!")
		end		
	end
end