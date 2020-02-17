feature 'can log out' do
  scenario 'able to log out and get to log in page' do
    visit('/log_out')
    expect(page).to have_content('You have logged out. Come back soon!')
    click_link('Log back in')
    expect(page).to have_content('Welcome to Chitter')
  end
end
