feature "Checking user enters email to sign up" do 
  scenario "User must give email before pressing sign up" do 
    visit "/sign_up"
    fill_in("email", with: "")
    click_button('Sign up')
    expect(page).to have_current_path('/sign_up')
  end 
end

feature "User can press button to return to homepage" do 
  scenario "User presses homepage button" do 
    visit "/sign_up/success"
    click_button('Return to homepage')
    expect(page).to have_current_path('/')
  end 
end 
