feature 'User' do
  scenario 'signs up' do
    visit '/'
    expect(page).not_to have_content('Welcome, test@test.com')
    click_link('Sign up')
    fill_in('username', with: 'rodcul')
    fill_in('email', with: 'rodcul@gmail.com')
    click_link('Sign up')
    expect(page).to have_content('Welcome, rodcul')
  end
end
