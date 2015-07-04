feature 'A user can sign up' do
  scenario 'user sees first page' do
    visit '/'
    expect(page).to have_content 'Welcome'
  end

  scenario 'user can sign up' do
    user = create :user
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'Sign up'
  end

  scenario 'user can sign in' do
    user = create :user
    visit 'sessions/new'
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'Sign up'
    expect(page).to have_content 'Welcome back, foobar_user'
  end
end
