feature 'User logs out' do
  before(:each) do
    User.create(email: 'test@test.com',
                password: '12345',
                password_confirmation: '12345',
                name: 'test',
                user_name: 'test1')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: '12345')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end