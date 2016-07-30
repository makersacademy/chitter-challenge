feature 'User signs out' do

  before(:each) do
    User.create(username: 'userexample',
                password: 'secret',
                confirm_password: 'secret',
                name: 'sam',
                email: 'sam@example.com')
  end

  scenario 'while signed in' do
    sign_in(username: 'userexample', password: 'secret')
    click_button 'Sign Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, userexample')
  end
end
