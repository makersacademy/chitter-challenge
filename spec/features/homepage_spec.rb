feature "Prints home page" do 
  scenario "prints string" do 
    visit "/"
    expect(page).to have_content "Hello, World!"
  end 
end 