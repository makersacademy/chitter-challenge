feature 'User signs out' do

  before(:each) do
    User.create(name: 'Jean Tremblay',
                username: 'jt12',
                email: 'jean@example.com',
                password: 'trout',
                password_confirmation: 'trout')
  end

  scenario 'while being signed in' do
    sign_in(email: 'jean@example.com', password: 'trout')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
