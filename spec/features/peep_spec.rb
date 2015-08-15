
feature "Peep" do

	scenario "User can see peeps displayed on the peeps page" do
		Peep.create(content: "I am a test peep")

		visit '/peeps'
		expect(page.status_code).to eq 200
		expect(page).to have_content("I am a test peep")
	end


	scenario "User can create a new peep" do
		visit "/peeps/new"
		fill_in "content", with: "I am a test peep"
		click_button "Peep"
		expect(current_path).to eq "/peeps"
		expect(page).to have_content "I am a test peep"
	end


end