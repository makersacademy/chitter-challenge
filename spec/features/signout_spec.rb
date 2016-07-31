feature 'User signs out' do

  before(:each) do
    User.create(full_name: 'User',
                username: 'user100',
                email: 'test100@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(username: 'user100', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, user100')
  end

end
