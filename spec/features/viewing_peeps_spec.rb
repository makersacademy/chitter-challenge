require 'pg'

feature "View all peeps" do 
  scenario "A user can see all the peeps" do 

    # Add test data to peeps table
    Peeps.create(message: "Test Example peep 1")
    Peeps.create(message: "Test Example peep 2")
    Peeps.create(message: "Test Example peep 3")
  

    visit('/chitter')

    expect(page).to have_content("Test Example peep 1")
    expect(page).to have_content("Test Example peep 2")
    expect(page).to have_content("Test Example peep 3")
  end 
end 
