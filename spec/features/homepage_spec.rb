feature "Displays home page with user options" do 
  scenario "prints string" do 
    visit "/"
    expect(page).to have_content "Welcome to Chitter ! What would you like to do ?"
  end 

  scenario "User clicks cheets button and is directed to new page" do 
    visit "/"
    click_button('Cheets')
    expect(page).to have_current_path('/cheets')
  end  

  scenario "User clicks cheets button and is directed to new page" do 
    visit "/"
    click_button('Sign up for chitter here!')
    expect(page).to have_current_path('/sign_up')
  end
end 
