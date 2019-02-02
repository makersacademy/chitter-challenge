# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'users can log into Chitter' do

  scenario 'the login process should work' do
    User.create(name: 'Ivan', username: 'ivan', email: 'fake@fake.com', password: 'pass')
    visit '/'
    click_button 'Login'
    expect(current_path).to eq '/sessions/new'
    fill_in(:username, with: 'ivan')
    fill_in(:password, with: 'pass')
    click_button('Submit')
    expect(page).to have_content 'Welcome, Ivan. You are logged in.'
  end

  xscenario 'the posts should show their owner' do

  end

end