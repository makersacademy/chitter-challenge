feature "Checking user enters email to sign up" do 
  scenario "User must give email before pressing sign up" do 
    visit "/sign_up"
    fill_in("email", with: "")
    click_button('Sign up')
    expect(page).to have_current_path('/sign_up')
  end 
end