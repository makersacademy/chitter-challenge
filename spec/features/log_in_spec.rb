feature 'Log in page' do
  # as a social media user
  # so i can see the chitter feed
  # i want to be able to view the chitter peeps
  scenario 'a social media user can land on the home page and log in to chitter' do
    visit('/')
    expect(page).to have_content('Chitter')
    expect(page).to have_button('Register/ Sign-up')
    click_button('Register/ Sign-up')
    expect(page).to have_content('Register/ Sign-up')
  end
end
