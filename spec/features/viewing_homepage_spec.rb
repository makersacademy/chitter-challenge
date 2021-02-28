feature "viewing homepage" do 
  scenario "visiting index page" do 
    visit('/peeps')
    expect(page).to have_content "Today at Chitter!"
  end 
end 
