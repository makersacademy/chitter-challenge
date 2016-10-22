feature 'signing up' do

	scenario 'user is added to the database after successful signup' do
		visit '/'
		click_button 'Register'
		fill_in :email, with: 'foobar@foobar.com'
		fill_in :password, with: "foobar"
		fill_in :password_confirmation, with: "foobar"
		expect{click_button 'Sign Up'}.to change{User.count}.by(1)
  end
 
  scenario 'shows message after successful signup' do
		visit '/'
		click_button 'Register'
		fill_in :email, with: 'foobar@foobar.com'
		fill_in :password, with: "foobar"
		fill_in :password_confirmation, with: "foobar"
		click_button 'Sign Up'
		expect(page).to have_content "Sign Up Successful"
  end

end