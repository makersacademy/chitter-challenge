feature 'user logging in and out' do
  scenario 'user can log in and is redirect to peeps page' do
    sign_up('timmy', 'timmy@hello.com')
    login(12345)
    expect(page.current_path).to eq '/peeps'
    expect(page).to have_content 'Hello, timmy!'
  end

  scenario 'user can log out and is then redirected to index' do
    sign_up('timmy', 'timmy@hello.com')
    click_button('Logout')
    expect(page).to have_content('Goodbye, timmy!')
    expect(page.current_path).to eq('/peeps')
  end
end
