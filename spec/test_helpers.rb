def sign_up_and_continue 
    visit '/home'
    click_link "Sign up"
    fill_in("email", with: "my_email@email.com")
    fill_in("password", with: "password123")
    fill_in("name", with: "Dan T")
    fill_in("username", with: "ddottyler")
    click_button 'Confirm sign up'
end 