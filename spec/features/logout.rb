feature 'log in ' do
  scenario 'log in with email and password' do
    login_simon

    click_button('log out')
    click_button('login')

    expect(page).not_to have_selector("input[type=submit][value='post message']")
  end

end
