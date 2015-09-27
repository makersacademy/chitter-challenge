feature 'Sign in & Sign out' do
  scenario 'User can sign in with valid information' do
    user = create(:user)
    sign_in(user)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.nickname)
  end

  scenario 'User cannot sign in with invalid password' do
    user = build(:user, password: 'pass')
    sign_in(user)
    expect(page).to have_content('Email or password is invalid')
  end

  scenario 'User cannot sign in with non-existent email' do
    user = build(:user, email: 'no@email.com')
    sign_in(user)
    expect(page).to have_content('Email or password is invalid')
  end

  scenario 'User can sign out while being signed in' do
    user = create(:user)
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('Good bye!')
  end
end

def sign_in(user)
  visit '/sessions/new'
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Sign in'
end
