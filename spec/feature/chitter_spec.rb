
  feature "Homepage" do 
    scenario "Checks for header on homepage" do 
      visit '/'
      expect(page).to have_content "Chit chat"
    end 

    scenario "Submit button click" do 
      visit '/'
      click_button "Submit message"
    end 
  end


