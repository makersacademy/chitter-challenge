require 'capybara'

def sign_up(
		email: 'email@mail.com', 
		username: 'Test_user', 
		password: 'super secret', 
		password_confirmation: 'super secret' 
	)
	visit '/user/new'
	fill_in 'email', with: email
	fill_in 'password', with: password
	fill_in 'password_confirmation', with: password_confirmation
	click_button 'Sign up'
end

def sign_in(email: 'email@mail.com', password: 'super secret')
	visit '/user/login'
	fill_in 'email', with: email
	fill_in 'password', with: password
	click_button 'Sign in'
end

feature 'user sign up' do

	scenario 'successful sign up' do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content 'Welcome Test_user'
	end

	scenario 'Passwords dont match' do
		expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
		expect(current_path).to eq("/user/login")
		expect(page).to have_content "Password does not match the confirmation"
	end

	scenario "nil email address" do
		expect { sign_up(email: nil) }.not_to change(User, :count)
	end

	scenario "invalid address" do
		expect { sign_up(email: "elena") }.not_to change(User, :count)
	end

	scenario "taken address" do
		sign_up
		expect { sign_up }.not_to change(User, :count)
		expect(page).to have_content "Email is already taken"
	end

end

feature 'Sign in' do

	before(:each) do
		sign_up
	end

	scenario 'can sign in' do
		sign_in
		expect(page).to have_content 'Welcome Test_user'
	end

	scenario 'can sign in' do
		sign_in(password: 'wrong')
		expect(page).to have_content "The email or password is incorrect"
	end

	# scenario 'can sign out' do
	# 	sign_in
	# 	click_link "Sign out"
	# 	expect(page).to have_content "Goodbye!"
	# end


end