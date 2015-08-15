feature "User sign up" do 

#Need to fix with FactoryGirl
#let (:user) { sign_up(email: 'ben@test.com', password: 'password', password_confirmation: 'password') }
# let(:user) { FactoryGirl.create(:user) }

	scenario "I can sign up as a new user" do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content ('Welcome, ben@test.com')
		expect(User.first.email).to eq('ben@test.com')
	end

	scenario "with a password that does not match" do
		expect {sign_up(password_confirmation: "wrong") }.not_to change(User, :count)
		expect(current_path).to eq("/users")
		expect(page).to have_content "Password does not match"
	end

	scenario "cannot sign up with providing valid email" do
		expect {sign_up(email: "bob") }.not_to change(User, :count)
		expect(current_path).to eq("/users")
		expect(page).to have_content "Email has an invalid format"
	end

	#need to refactor with FactoryGirl
	scenario "cannot sign up with an existing email registered previously" do
		sign_up(email: 'ben@test.com', password: 'password', password_confirmation: 'password')
		expect { sign_up(email: 'ben@test.com', password: 'password', password_confirmation: 'password') }.to change(User, :count).by(0)
		expect(page).to have_content('Email is already taken')
	end

	def sign_up(email: 'ben@test.com', password: 'password', password_confirmation: 'password')
		visit "/users/new"
		expect(page.status_code).to eq(200)
		fill_in :email, with: email
		fill_in :password, with: password
		fill_in :password_confirmation, with: password_confirmation
		click_button "Sign Up"
	end

end

feature "User sign in" do
	let(:user)

end