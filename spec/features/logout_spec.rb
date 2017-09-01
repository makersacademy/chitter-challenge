feature 'Log Out' do

  before do
    sign_up_first
    log_in("jon@winterfell.com", "winterishere")
  end

  scenario 'I can log out of my Chitter account' do
    click_on "Log out"
    expect(page).to have_content "See you soon, Jon Snow. You have successfully logged out"
  end

end
