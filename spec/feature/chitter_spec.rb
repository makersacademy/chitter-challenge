
  feature "Header title" do 
    scenario "Checks for header on homepage" do 
      visit '/'
      expect(page).to have_content "Chit Chat"
    end 
  end


