feature 'User sign in' do

  let!(:user) do
    User.create(name: 'Jack Bauer',
                user_name: 'Jack24',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
  end

  scenario 'with correct credentials' do
    sign_in(user_name: user.user_name,   password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

  def sign_in(user_name:, password:)
    visit '/sessions/new'
    fill_in :user_name, with: user_name
    fill_in :password, with: password
    click_button 'Sign in'
  end

end

feature 'User signs out' do

  before(:each) do
    User.create(name: 'Jack Bauer',
                user_name: 'Jack24',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
  end

  scenario 'while being signed in' do
    sign_in(user_name: 'Jack24', password: 'damn_it!')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, Jack Bauer')
  end

end
