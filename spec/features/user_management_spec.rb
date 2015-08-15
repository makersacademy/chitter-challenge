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

	scenario "cannot sign up without providing valid email" do
		expect {sign_up(email: "bob") }.not_to change(User, :count)
		expect(current_path).to eq("/users")
		expect(page).to have_content "Email has an invalid format"
	end

	#need to refactor with FactoryGirl
	scenario "cannot sign up with an existing email previously registered" do
		sign_up(email: 'ben@test.com', username: '@ben', password: 'password', password_confirmation: 'password')
		expect { sign_up(email: 'ben@test.com', username: '@ben', password: 'password', password_confirmation: 'password') }.to change(User, :count).by(0)
		expect(page).to have_content "Email is already taken"
	end

	scenario "cannot sign up with an existing username previously registered" do
		sign_up(email: 'ben@test.com', username: '@ben', password: 'password', password_confirmation: 'password')
		expect { sign_up(email: 'ben@test.com', username: '@ben', password: 'password', password_confirmation: 'password') }.to change(User, :count).by(0)
		expect(page).to have_content "Username is already taken"
	end

	#refactor note - pull out in helpers folder
	#during refactor add name as a field to sign up (it is not a required field)
	def sign_up(email: 'ben@test.com', username: '@ben', password: 'password', password_confirmation: 'password')
		visit "/users/new"
		expect(page.status_code).to eq(200)
		fill_in :email, with: email
		fill_in :username, with: username
		fill_in :password, with: password
		fill_in :password_confirmation, with: password_confirmation
		click_button "Sign Up"
	end

end

feature "User sign in" do

	let(:user) { User.create(email: 'ben@test.com', username: '@ben', password: 'password', password_confirmation: 'password') }

	scenario "user will be succesfully signed in (with correct credentials)" do
		sign_in(email: user.email, password: user.password)
		expect(page).to have_content "Welcome, #{user.email}"
	end

	def sign_in(email:, password:)
		visit "/sessions/new"
		fill_in :email, with: "ben@test.com"
		fill_in :password, with: "password"
		click_button "Sign In"
	end

end

#take the sign in and sign up methods out in a separate helper module (see section 7)
#refactor opportunity
feature "User sign out" do
	before(:each) { User.create(email: 'ben@test.com', username: '@ben', password: 'password', password_confirmation: 'password') }

	scenario "user can sign out while signed in" do
		sign_in(email: "ben@test.com", password: "password")
		click_button "Sign Out"
		expect(page).to have_content("You are now logged out")
		expect(page).not_to have_content("Welcome, ben@test.com")
	end

	#duplication from sign in feature - pull out into helper module
	def sign_in(email:, password:)
		visit "/sessions/new"
		fill_in :email, with: "ben@test.com"
		fill_in :password, with: "password"
		click_button "Sign In"
	end

end





