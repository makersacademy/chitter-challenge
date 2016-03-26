feature 'logs out' do
  doubles

  scenario 'user is logged out' do
    log_in(username: maker.username, password: maker.password)
    click_button 'Log Out'
    expect(page).to have_content 'Bye!'
  end
end
