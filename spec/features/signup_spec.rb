feature "signing up" do
  scenario "the homepage has a sign up feature" do
    visit '/'
    click_button 'sign up'
    fill_in('name', with: "Coolsite")
    fill_in('username', with: "SyedAtMakers")
    fill_in('email', with: "help@makersacademy.com")
    fill_in('psw', with: "getmeout")
    click_button('Sign Up')
    expect(page).to have_content "Welcome @username"
  end
end
