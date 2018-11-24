feature 'registration' do
	scenario 'A user can sign up' do
		visit('/users/new')
		fill_in('name', with: 'test3')
		fill_in('u_name', with: 'test3')
		fill_in('email', with: 'test3@test.com')
		fill_in('password', with: 'test1234')
		click_button('Submit')
		expect(page).to have_content "Welcome, test3!"
	end
end