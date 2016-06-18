feature 'signing up' do
	scenario 'I can sign up with a' do
		visit '/'
		fill_in :username, with: 'username'
		fill_in :email, with: 'name@gmail.com'
		fill_in :name, with: 'Name Surname'
		fill_in :password, with: 'password'
		click_button 'Sign up'
		expect(page).to have_content 'Wecome, Name'
	end
end
