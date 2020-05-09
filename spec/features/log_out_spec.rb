feature 'log out' do
  scenario 'user can log out' do
    log_in
    click_link('log out')
    expect(page).to have_content('log in')
  end
end
