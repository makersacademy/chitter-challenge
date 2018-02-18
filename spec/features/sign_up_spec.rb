feature 'Sign up' do
  scenario 'User can sign up with an email and password' do
    sign_up
    expect(page).to have_content 'Sign up successful!'
    expect(page).to have_content 'Welcome to Chitter, Daniel!'
  end
end
