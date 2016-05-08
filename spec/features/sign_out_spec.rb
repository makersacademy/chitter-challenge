feature 'User signs out' do

  before(:each) do
    User.create(name: 'Robin Heathcote',
                username: 'robin1',
                email: 'robin@example.com',
                password: 'oranges!',
                password_confirmation: 'oranges!')
  end

  scenario 'while being signed in' do
    sign_in(username: 'robin1', password: 'oranges!')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, robin1')
  end

end
