feature 'User signs out' do

  scenario 'while being signed in' do
    sign_up
    sign_in
    click_button 'Sign out'
    expect(page).to have_content "Logged out"
  end

  def sign_in
    user = build :user
    visit '/'
    click_link 'Sign in'
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'Sign in'
  end

  def sign_up
    user = build :user
    visit '/'
    click_link 'Sign up'
    fill_in :email, with: user.email
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'Sign up'
  end

end
