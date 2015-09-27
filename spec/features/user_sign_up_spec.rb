feature 'Signing up as a user:' do

  scenario 'I can sign up as a new user' do
    user = build :user
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: user.name
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :handle, with: user.handle
    click_button 'Sign up'
    expect(User.first.handle).to eq(user.handle)
  end

  scenario 'I am signed in once I\'ve signed up' do
    user = build :user
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: user.name
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :handle, with: user.handle
    click_button 'Sign up'
    expect(page).to have_content('You are signed in as Foogene Barrington (@foobar)')
  end

end
