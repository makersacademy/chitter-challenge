feature 'Signing up' do

  scenario 'user can sign up' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter test'
  end

  scenario 'user cannot sign up if the username is taken' do
    sign_up
    click_button 'Sign out'
    visit '/'
    within 'form#sign_up' do
      fill_in 'username', with: 'test_name'
      fill_in 'name', with: 'another_name'
      fill_in 'email', with: 'another@email.com'
      fill_in 'password', with: 'another_secret'
    end
    click_button 'Sign up'
    expect(page).to have_content 'This username is already taken'
  end

  scenario 'user cannot sign up if the email is taken' do
    sign_up
    click_button 'Sign out'
    visit '/'
    within 'form#sign_up' do
      fill_in 'username', with: 'another_name'
      fill_in 'name', with: 'another_name'
      fill_in 'email', with: 'example@example.com'
      fill_in 'password', with: 'another_secret'
    end
    click_button 'Sign up'
    expect(page).to have_content 'This email already exits, trying signing in'
  end

  scenario 'new users are added to the database' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'after going through a walk through user can send first Peep' do
    sign_up
    click_button 'Send my first Peep'
    expect(page).to have_content 'Post your first peep!'
  end

end
