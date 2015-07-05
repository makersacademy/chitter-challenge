feature 'A user can sign up' do
  scenario 'user sees first page' do
    visit '/'
    expect(page).to have_content 'Welcome'
  end

  scenario 'user can sign up' do
    sign_up
  end

  scenario 'user can sign in' do
    sign_up
    sign_in
    expect(page).to have_content 'Welcome back, foobar_user'
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
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

  def sign_in
    user = build :user
    visit '/'
    click_link 'Sign in'
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'Sign in'
  end
end
