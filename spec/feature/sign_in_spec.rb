feature "Sign in" do
  scenario "Steve Kahn signs into his chitter account" do
    visit '/'
    click_button('Sign In')
    fill_in('username', with: 'SteveKahn1')
    fill_in('password', with: 'password')
    click_button('Login')
    expect(page.title).to have_content "SteveKahn1"
  end
end
