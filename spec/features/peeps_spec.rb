
feature "Viewing & Creating Peeps" do

	scenario "User can create a new peep" do
	 	#this top line not required until DB relations issue sorted. 
	 	sign_in(email: "ben@test.com", password: "password")
		visit "/peeps/new"
	 	fill_in "content", with: "I am a test peep"
	 	click_button "Peep"
	 	expect(current_path).to eq "/peeps"
	 	expect(page).to have_content "I am a test peep"
	end

	scenario "All peeps from all users are displayed on index page"


	def create_user
	   User.create(email:    'ben@test.com',
	              username: '@ben',
	              password: 'password',
	              password_confirmation: 'password')
	end

	def sign_in(email:, password:)
		visit "/sessions/new"
		fill_in :email, with: "ben@test.com"
		fill_in :password, with: "password"
		click_button "Sign In"
	end

end