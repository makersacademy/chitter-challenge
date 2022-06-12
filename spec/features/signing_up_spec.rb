feature "Sign up to chitter" do 
  scenario "A user can sign up and create an account" do 
    visit ('/chitter/signup')
    fill_in('name', with: "Test Example")
    fill_in('username', with: "T.example1")
    fill_in('email', with: "test@example.com")
    fill_in('password', with: "T.example1")
    click_button('sign_up2')

    expect(page).to have_content "You've successfully signed up to chitter!"
  end 
end 