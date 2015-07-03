feature 'Signing up' do

  before(:each) { @user = User.new(user_params)}

  scenario 'user can sign up' do
    sign_up(@user)
    expect(page).to have_content 'Welcome to Chitter test'
  end

  scenario 'new users are added to the database' do
    expect { sign_up @user }.to change(User, :count).by(1)
  end

  scenario 'after going through a walk through user can send first Peep' do
    sign_up(@user)
    click_button 'Send my first Peep'
    expect(page).to have_content 'test, your Peeps'
  end

  def sign_up(user)
    visit '/'
    within 'form#sign_up' do
      fill_in 'username', with: user.username
      fill_in 'name', with: user.name
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
    click_button 'Sign up'
  end

  def user_params
    { email: 'example@example.com',
      password: 'secret123',
      name: 'test',
      username: 'test_name'}
  end

end
