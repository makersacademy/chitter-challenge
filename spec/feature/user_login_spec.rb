feature 'User Log in' do

  let(:user) do
    User.create(username: 'knowerlittle',
                name: 'Noah Pollock',
                email: 'pollocknoah@gmail.com',
                password: 'makers15',
                password_confirmation: 'makers15')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

end

feature 'User signs out' do

  before(:each) do
    User.create(username: 'knowerlittle',
                name: 'Noah Pollock',
                email: 'pollocknoah@gmail.com',
                password: 'makers15',
                password_confirmation: 'makers15')
  end

  scenario 'while being signed in' do
    sign_in(email: 'pollocknoah@gmail.com', password: 'makers15')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, pollocknoah@gmail.com')
  end

end
