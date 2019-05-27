feature 'Sign  up' do
  scenario 'It allows the user to enter an name, username, email and password' do
    visit('/')
    click_button 'Sign up'
    expect(page).to have_field('name')
    expect(page).to have_field('username')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
  end
end
