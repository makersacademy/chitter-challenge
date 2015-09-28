require './spec/factories/user'

feature 'signing up' do
  scenario 'can sign up with email, username, password and name' do
    user = build :user
    sign_up user, user.password
    user = build :user
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Log in'
    expect(page).to have_content "Hi, #{user.username}"
  end

  scenario 'can only sign up with matching passwords' do
    user = build :user
    sign_up user, 'wrong password'
    expect(current_path).to eq('/user/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'cannot sign up with email already taken' do
    user = create :user
    sign_up user, 'wrong password'
    expect(current_path).to eq('/user/new')
    expect(page).to have_content 'Email is already taken'
    expect(page).to have_content 'Username is already taken'
  end
end
