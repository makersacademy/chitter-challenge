feature 'log in ' do
  scenario 'log in with email and password' do
    login_simon

    expect(page).to have_selector("input[type=submit][value='post message']")
  end

end
