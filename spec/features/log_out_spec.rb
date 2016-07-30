feature 'log out' do
  scenario 'I can log out' do
    sign_up
    log_out
    expect(page).to have_content('You have logged out')
    expect(page).not_to have_content('test')
  end
end
