feature "sign up" do
  scenario "User can sign up" do
    visit '/'
    click_button('Sign Up')
    fill_in('name', with: 'Chitty chitty')
    fill_in('username', with: 'chatty')
    fill_in('email', with: '123@hotmail.com')
    fill_in('password', with: '2222')
    click_button('Sign Up')
    expect(page).to have_content "Sign in to Chitter!"
  end
end
