feature 'log in' do
  scenario 'pressing log in on the homepage takes you to the log in page' do
    visit('/')
    click_button('Log In')
    expect(page).to have_field('Email')
    expect(page).to have_button('Log In')
  end

  scenario 'it doesnt allow you to log in when not signed up' do
    visit('/login')
    fill_in 'email', with: 'john@gmail.com'
    fill_in 'password', with: '123'
    click_button('Log In')
    expect(page).to have_content('Incorrect login credentials')
  end
end