feature 'User can sign up for Chitter' do 
  scenario 'User logs in with correct info' do 
    example_user = SignUp.create(email: 'example1@fake_email.com', password: 'Password123', user_name: 'Joe Biden', handle: 'sleepy_joe')
    visit '/'
    click_on 'Sign up'
    fill_in 'email', with: 'example1@fake_email.com'
    fill_in 'password', with: 'Password123'
    click_on 'Submit'
    expect(page).to have_content 'Thanks for signing up for Chitter Joe Biden'
  end
end