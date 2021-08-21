feature "Displays home page with user options" do 
  scenario "prints string" do 
    visit "/"
    expect(page).to have_content "Welcome to Chitter ! What would you like to do ?"
  end 
end 

feature "Redirects user to add a post page" do 
  scenario "User clicks add post button" do 
    visit "/"
    click_button('Add post')
    expect(page).to have_current_path('/add_post')
    expect(page).to have_content("Add new post page")
  end 

  scenario "User clicks cheets button" do 
    visit "/"
    click_button('Cheets')
    expect(page).to have_current_path('/cheets') 
  end 
end 

