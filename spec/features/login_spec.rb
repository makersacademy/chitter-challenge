feature 'log in' do
  scenario 'pressing log in on the homepage takes you to the log in page' do
    visit('/')
    click_button('Log In')
    expect(page).to have_field('Username')
    expect(page).to have_button('Log In')
  end
end