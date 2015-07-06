feature 'Signing in' do

  scenario 'exisitng user can give their username and password' do
    sign_in
    expect(page).to have_content 'Hi test, here are your Peeps'
  end

  scenario 'user cannot sign in if they have not yet signed up' do
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: 'not_signed_up'
      fill_in 'password', with: 'no_password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'No username exists, try signing up'
  end

  scenario 'an existing user cannot sign in if their password is incorrect' do
    user = User.create(user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: 'not_the_right_password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Incorrect password'
  end

  scenario 'once signed in a user can see all their peeps' do
    user = User.create(user_params)
    Peep.create(text: 'Hello world!', time_stamp: Time.now, user_id: user.id)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Hello world!'
  end

  scenario 'if user does not exist' do
    sign_in
    visit '/anonymous'
    expect(page).to have_selector 'form#home'
    expect(page).to have_content 'User does not exits'
  end

  scenario 'when a logged in user looks at another user page with no peeps she can go back to her home page' do
    User.create(username: 'tansaku', name: 'Samuel Russell Hampden Joseph', email: 'sam@makersacademy.com', password: 's3cr3t')
    sign_in
    visit '/tansaku'
    expect(page).not_to have_selector 'form#peep'
    click_button 'Home'
    expect(page).to have_selector 'form#peep'
  end

  scenario 'when a logged in user looks at another user page with no peeps she can go back to her home page' do
    user = User.create(username: 'tansaku', name: 'Samuel Russell Hampden Joseph', email: 'sam@makersacademy.com', password: 's3cr3t')
    Peep.create(text: 'It is me', time_stamp: Time.now, user_id: user.id)
    sign_in
    visit '/tansaku'
    expect(page).not_to have_selector 'form#peep'
    click_button 'Home'
    expect(page).to have_selector 'form#peep'
  end

end
