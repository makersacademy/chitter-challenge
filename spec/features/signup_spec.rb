feature "signup" do
  scenario "user clicks button from homepage and signs up" do
    visit('/')
    click_button('Sign Up')
    fill_in(:name, with: "Kiril D")
    fill_in(:email, with: "kiriarf@gmail.com")
    fill_in(:username, with: "kiriarf")
    fill_in(:password, with: "password123")
    click_button('Register')
    expect(page).to have_content("Hi, kiriarf")
  end  
end
