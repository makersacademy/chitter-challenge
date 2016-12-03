def sign_up
	visit '/users/new'
	expect(page.status_code).to eq(200)
	fill_in 'firstname',  :with => 'John'
	fill_in 'surname', :with => 'Doe'
	fill_in 'username', :with => 'JayDawg'
	fill_in 'email', :with => 'john@doe.com'
	fill_in 'password', :with => 'password123'
	fill_in 'password_confirmation', :with => 'password123'
	click_button 'Sign Up'
end