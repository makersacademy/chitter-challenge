feature 'chitter log out user' do
  scenario 'the user log out' do
    Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
    log_out
    expect(page).to have_content 'Sign up'
  end
end
