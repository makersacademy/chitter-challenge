feature 'signing up' do

	scenario 'user is added to the database after successful signup' do
		expect{sign_up}.to change{User.count}.by(1)
		expect(page).to have_content "Sign Up Successful"
  end

  scenario 'does not add user after incorrect signup' do
  	visit_register_page
		fill_in :email, with: 'foobar@foobar.com'
		fill_in :password, with: "foobar"
		fill_in :password_confirmation, with: "foobar1"
		expect{click_button 'Sign Up'}.to_not change{User.count}
		expect(page).to have_content "Password does not match the confirmation"
	end

	scenario 'cannot sign up with empty email address' do
  	visit_register_page
		fill_in :email, with: ' '
		enter_password_for_signup
	  expect{click_button 'Sign Up'}.to_not change{User.count}
		expect(page).to have_content "Email must not be blank"
	end

	scenario 'shows error message when email is the wrong format' do
  	visit_register_page
		fill_in :email, with: 'email@mail..com'
    enter_password_for_signup
		expect{click_button 'Sign Up'}.to_not change{User.count}
		expect(page).to have_content "Email has an invalid format"
	end

	scenario "Cannot sign up with an already registered email address" do
    sign_up
    click_button "Log Out"
    click_button 'Register'
		fill_in :email, with: 'foobar@foobar.com'
		enter_password_for_signup
		expect{click_button 'Sign Up'}.to_not change{User.count}
		expect(page).to have_content "Email is already taken"
	end
end