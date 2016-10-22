feature 'add user' do

	scenario 'sign up a user' do
		visit '/'
		click_button 'Register'
		fill_in :email, with: 'asif.hafeez@hotmail.co.uk'
		fill_in :password, with: "foobar"
		fill_in :password_confirmation, with: "foobar"
		expect{click_button 'Sign Up'}.to change{User.count}.by(1)
  end

end