feature 'User signs out' do

  before(:each) do
    User.create(name: 'Joe',
                user_name: 'Joe123',
                email: 'joe@example.com',
                password: 'secret')
  end

  scenario 'I can sign out after signing in' do
    sign_in(email: 'joe@example.com', password: 'secret')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, Joe')
  end

end
