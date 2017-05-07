require 'capybara'

feature 'A new user can create an account' do

	 scenario 'sign-up was successful' do
 		 expect { sign_up }.to change(User, :count).by(1)
 		 expect(page).to have_content "Hello Anthony"
 	end

	 scenario 'user did not enter matching email addresses' do
 		 expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
 		 expect(current_path).to eq("/user/new")
 		 expect(page).to have_content "Password does not match the confirmation"
 	end

	 scenario "user cannot create an account without an email address" do
 		 expect { sign_up(email: nil) }.not_to change(User, :count)
 	end

	 scenario "user entered an invalid email address" do
 		 expect { sign_up(email: "not_an_email_address") }.not_to change(User, :count)
 	end

	 scenario "user fails to create a new accout with the same email address" do
 		 sign_up
 		 expect { sign_up }.not_to change(User, :count)
 		 expect(page).to have_content "Email is already taken"
 	end

end

feature 'Signing in' do

	 before(:each) do
 		 sign_up
 	end

	 scenario 'user can sign in' do
 		 sign_in
 		 expect(page).to have_content 'Hello Anthony'
 	end

	 scenario 'user enters an incorrect password' do
 		 sign_in(password: 'wrong')
 		 expect(page).to have_content "Incorrect email or password, please try again."
 	end

  scenario 'user enters an incorrect email' do
		  sign_in(email: 'wrong@email.co.uk')
		  expect(page).to have_content "Incorrect email or password, please try again."
	 end

	 scenario 'user can sign out' do
 		 sign_in
 		 click_link "Sign out"
 		 expect(page).to have_content "Login"
 	end

end
