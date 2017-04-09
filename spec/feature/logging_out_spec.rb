feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'password',
                password_confirmation: 'password',
                name: 'Test McTester',
                username: 'testalltheoutcomes')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'password')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
