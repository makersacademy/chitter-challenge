feature "Chitter main page" do 
  scenario "User clicks return to homepage button and is redirected" do 
    visit "/cheets"
    click_button('Return to home')
    expect(page).to have_current_path('/')
  end 
end 
