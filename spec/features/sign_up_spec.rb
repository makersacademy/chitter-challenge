feature "User sign up" do
  scenario "user visits homepage and fills form to sign up" do
    visit '/user/sign_up'
    fill_in('email', with: 'test@example.com')
    fill_in('name', with: 'test')
    fill_in('username', with: 'test123')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Sign Up')

    expect(page.status_code).to be 200
    expect(User.all.length).to eq 1
    expect(User.first.email).to eq 'test@example.com'
    expect(User.first.username).to eq 'test123'
    expect(page).to have_content 'Welcome test123'
  end
end
