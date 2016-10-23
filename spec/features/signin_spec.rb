feature 'signing in' do

	let(:user) do 
		User.create(email: "foobar@example.com", password: "foobar",
			          password_confirmation: "foobar")
	end

	scenario 'registered user can sign in' do
   visit '/'
   fill_in :email, with: user.email
   fill_in :password, with: user.password
   click_button "Sign In"
   expect(page).to have_content "You have successfully signed in as foobar@example.com"
  end
 

 scenario 'user cannot sign in with wrong password' do
   visit '/'
   fill_in :email, with: user.email
   fill_in :password, with: "wrongpassword"
   click_button "Sign In"
   expect(page).to have_content "The email or password is incorrect"
  end
  
end