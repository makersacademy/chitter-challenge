feature 'user logging in and out' do
  scenario 'user can log in and is redirect to peeps page' do
    sign_up('timmy', 'timmy@hello.com')
    visit '/sessions/new'
    fill_in('username', with: 'timmy')
    fill_in('password', with: '12345')
    click_button('Login')
    expect(page.current_path).to eq '/peeps'
    expect(page).to have_content 'Hello, timmy!'
  end
end
