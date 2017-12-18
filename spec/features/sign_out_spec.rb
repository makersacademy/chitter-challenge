feature 'User signs out' do

  before(:each) do
    User.create(name: 'Lan Pham',
                email: 'test@test.com',
                username: 'Lan',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome to Chitter , Lan')
  end

end
