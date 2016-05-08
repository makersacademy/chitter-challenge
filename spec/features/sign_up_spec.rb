feature 'User sign up' do
  scenario 'A user can access sign up from home page' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_content 'Sign up to Chitter'
  end

  scenario 'A user can sign up, user count increases by one' do
    expect{ new_user }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Alex!')
    expect(User.first.name).to eq 'Alex'
  end

  scenario 'Requires a matching confirmation' do
    expect { new_user(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq ('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'Email address must be filled in' do
    expect {new_user email: nil}.to_not change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'Email address must be valid' do
    expect {new_user email: 'name@email'}.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'Email must be unique' do
    new_user
    expect {new_user}.to_not change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'Name must be filled in' do
    expect {new_user name: nil}.to_not change(User, :count)
    expect(page).to have_content 'Name must not be blank'
  end

  scenario 'Username must be filled in' do
    expect {new_user username: nil}.to_not change(User, :count)
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'Password must be filled in' do
    expect {new_user password: nil}.to_not change(User, :count)
    expect(page).to have_content 'Password must not be blank'
  end

end
