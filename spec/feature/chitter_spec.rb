  require 'message.rb'
  
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

  feature "Posting messages" do 
    scenario "Filling in form with text" do 
      visit '/'
      fill_in :content, with: 'This is a new message'
      click_button "Submit message" 
      expect(page).to have_current_path '/'
    end
  end 


