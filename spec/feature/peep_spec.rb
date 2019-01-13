  require 'peep.rb'
  
  feature "Homepage" do 

    scenario "Checks for header on homepage" do 
      visit '/'
      expect(page).to have_content "Chit chat"
    end 

    scenario "Submit button click" do 
      visit '/'
      click_button "Submit peep"
    end 
  end

  feature "Posting peeps" do 
    scenario "Filling in form with text" do 
      visit '/'
      fill_in :content, with: 'This is a new peep'
      click_button "Submit peep" 
      expect(page).to have_content "This is a new peep"
    end

    scenario "redirects back to index page" do 
      visit '/'
      fill_in :content, with: 'This is a new peep'
      click_button "Submit peep" 
      expect(page).to have_current_path '/'
    end

    scenario "Checks if peeps are being stored" do 
      visit '/'
      fill_in :content, with: 'Michael Nguyen'
      click_button "Submit peep"
      fill_in :content, with: "Thomas Nguyen"
      click_button "Submit peep"
      expect(page).to have_content "Michael Nguyen"
      expect(page).to have_content "Thomas Nguyen"
    end
  end
