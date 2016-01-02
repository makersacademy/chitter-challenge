feature 'Signing up to Chitter' do
  let!(:user) do
    User.new(name: 'Katie', username: 'KS', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')
  end

  let!(:user2) do
    User.new(name: 'Jack', username: 'JBrown', email: 'J@email.com', password: 'blue', password_confirmation: 'blue')
  end

  scenario 'A user can sign up' do
    sign_up(user)
    expect{ click_button 'Create account' }.to change(User, :count).by(1)
  end

  scenario 'A user cannot sign up with a username that is already taken' do
    user2[:username] = 'KS'
    sign_up(user)
    click_button 'Create account'
    sign_up(user2)
    expect{ click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'A user cannot sign up with an email that is already taken' do
    user2[:email] = 'K@email.com'
    sign_up(user)
    click_button 'Create account'
    sign_up(user2)
    expect{ click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'A user can only sign up with a valid email' do
    user[:email] = 'myemail.com'
    sign_up(user)
    expect{ click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'A user must enter a name' do
    user[:name] = ''
    sign_up(user)
    expect{ click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Name must not be blank'
  end

  scenario 'A user must enter a username' do
    user[:username] = ''
    sign_up(user)
    expect{ click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'A user must enter an email' do
    user[:email] = ''
    sign_up(user)
    expect{ click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'A user must enter a password' do
    user = User.new(name: 'Katie', username: 'KS', email: 'K@email.com', password: '', password_confirmation: 'secret')
    sign_up(user)
    expect{ click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Password must not be blank'
  end

  scenario 'A user must enter a password_confirmation' do
    user = User.new(name: 'Katie', username: 'KS', email: 'K@email.com', password: 'secret', password_confirmation: '')
    sign_up(user)
    expect{ click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Password confirmation must not be blank'
  end

  scenario 'A user must enter matching passwords' do
    user = User.new(name: 'Katie', username: 'KS', email: 'K@email.com', password: 'top', password_confirmation: 'secret')
    sign_up(user)
    expect{ click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
