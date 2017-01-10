feature 'User adds peep' do
  before(:each) do
    User.create(email: 'test@test.com',
    password: 'password',
    password_confirmation: 'password',
    name: 'test_name',
    username: 'test_username')
    log_in(email: 'test@test.com', password: 'password')
  end

  scenario 'add peep' do
    fill_in :peep, with: 'First peep!'
    click_button 'Post peep!'
    expect(page).to have_content('First peep!')
    expect(page).to have_content('test')
    expect(page).to have_content('test_name')
  end
end
