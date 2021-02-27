feature "viewing homepage" do 
  scenario "visiting index page" do 
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end 
end 
