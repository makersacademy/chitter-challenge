feature "Displats home page with usr options" do 
  scenario "prints string" do 
    visit "/"
    expect(page).to have_content "Welcome to Chitter ! What would you like to do ?"
  end 
end 

feature "Redirects user to add a post page" do 
  scenario "User clicks add post button" do 
    visit "/"
    click_button('Add a post')
    expect(page).to have_current_path('/add_post')
  end 
end 

