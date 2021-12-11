
feature "welcome '/' page" do
	
	scenario "user is greeted with 'Welcome to Chitter App' " do
		visit '/'
		expect(page).to have_content("Welcome to Chitter App")
	end


end