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
      expect(page).to have_content "This is a new message"
    end

    scenario "redirects back to index page" do 
      visit '/'
      fill_in :content, with: 'This is a new message'
      click_button "Submit message" 
      expect(page).to have_current_path '/'
    end

    scenario "Checks if messages are being stored" do 
      visit '/'
      fill_in :content, with: 'Michael Nguyen'
      click_button "Submit message"
      fill_in :content, with: "Thomas Nguyen"
      click_button "Submit message"
      expect(page).to have_content "Michael Nguyen"
      expect(page).to have_content "Thomas Nguyen"
    end
   end

   feature "Sign up" do 
    scenario "User sees able to click a sign up button" do 
      visit '/'
      click_button "Sign up"
    end 
    scenario "User is taken to a signup page" do 
      visit '/'
      click_button "Sign up"
      expect(page).to have_current_path '/signup'
    end
  end
