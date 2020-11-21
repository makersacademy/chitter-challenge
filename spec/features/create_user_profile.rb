feature 'Sign up to Chitter' do
  scenario 'So I can post on Chitter, I need my own profile' do
    visit('/users/new')
    fill_in('email', with: 'mario@mario.com')
    fill_in('password', with: 'password')
    fill_in('name', with: 'Mario Mario')
    fill_in('username', with: 'Mario123')
    click_button('Submit')
    expect(page).to have_content('Welcome, Mario!')
  end
end
