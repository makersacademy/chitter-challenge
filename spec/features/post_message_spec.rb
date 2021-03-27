feature 'post a message' do
  User.create('test_post@example.com', 'password123', 'test_post', 'test_post')

  scenario 'can post a message to top after login' do
    visit('/sessions/new')
    fill_in(:email, with: 'test_post@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    fill_in(:content, with: 'blablabla')
    click_button('Chit')
    expect(first('.list-message')).to have_content('blablabla')
    expect(first('.list-message')).to have_content('test_post')
  end
end