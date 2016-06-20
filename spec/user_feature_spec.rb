feature 'user sign up' do

	scenario 'successful sign up' do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content 'Welcome, Test_user'
	end

	scenario 'Passwords dont match' do
		expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
		expect(current_path).to eq("/user/new")
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
		expect(page).to have_content 'Welcome, Test_user'
	end

	scenario 'can\'t sign in with wrong password' do
		sign_in(password: 'wrong')
		expect(page).to have_content "The email or password is incorrect"
	end

	scenario 'can\'t sign in with wrong email' do
		sign_in(email: 'wrong@email.com')
		expect(page).to have_content "The email or password is incorrect"
	end

	scenario 'can sign out' do
		sign_in
		click_link "Sign out"
		expect(page).to have_content "CHITTLR: Login Sign up"
	end


end