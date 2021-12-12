feature 'Seeing time posted' do
  scenario 'User posts a peep and can see when it was posted' do
    example_user = SignUp.create(email: 'example1@fake_email.com', password: 'Password123', user_name: 'Joe Biden', handle: 'sleepy_joe')
    visit '/'
    click_on 'Log In'
    fill_in 'email', with: 'example1@fake_email.com'
    fill_in 'password', with: 'Password123'
    click_on 'Submit'
    click_on 'Home'
    fill_in 'text', with: 'I will Make America Great Again #MAGA'
    fill_in 'user_name', with: 'Donald Trump'
    fill_in 'handle', with: 'POTUS'
    click_on 'Submit'
    expect(page).to have_content 'I will Make America Great Again #MAGA'
    expect(page).to have_content 'Donald Trump'
    expect(page).to have_content '@POTUS'
    expect(page).to have_content 'Posted at'
  end
end
