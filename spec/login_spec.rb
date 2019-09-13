feature 'Log in' do
  scenario 'test login works, redirects to /peeps' do
    visit '/'
    fill_in 'Username', with: "Test987"
    fill_in 'Password', with: "password987"
    click_button "Log In"
    expect(page).to have_content "Chitter - Get your Daily Peeps"
  end
end