
feature 'Sign up' do
	
	scenario 'User enters name email username and password' do
		sign_up('Sam Blausten', 'test@test.com', 'sam', '1234')
		expect(page).to have_content 'Name: Sam Blausten'
		expect(page).to have_content 'Email: test@test.com'
		expect(page).to have_content 'Username: sam'
		expect(current_path).to eq '/account'
	end
	scenario "Can't sign up if username already exist" do
		add_user
		sign_up('Sam Blausten', 'other@test.com', 'sam', '1234')
		expect(page).to have_content 'Username already in use'
		expect(page).not_to have_content 'Name: Sam Blausten'
		expect(page).not_to have_content 'Email: other@test.com'
		expect(page).not_to have_content 'Username: sam'
		expect(current_path).not_to eq '/account'
	end
	scenario "Can't sign up if email already exist" do
		add_user
		sign_up('Sam Blausten', 'test@test.com', 'other', '1234')
		expect(page).to have_content 'Email already in use'
		expect(page).not_to have_content 'Name: Sam Blausten'
		expect(page).not_to have_content 'Email: test@test.com'
		expect(page).not_to have_content 'Username: other'
		expect(current_path).not_to eq '/account'
	end
end