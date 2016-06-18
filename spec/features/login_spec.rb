feature "log in" do
  scenario "user can log in" do
    create_user
    log_in
    expect(page).to have_content 'kennbarr'
  end

  scenario "can't log in with incorrect username" do
    create_user
    log_in_wrong_username
    expect(page).to have_content 'Invalid username or password'
  end

  scenario "can't log in with incorrect password" do
    create_user
    log_in_wrong_password
    expect(page).to have_content 'Invalid username or password'
  end

end
