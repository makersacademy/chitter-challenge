require 'web_helpers'

feature 'Signing up' do
  scenario 'user signs up and receives a confirmation message' do
    sign_up(username: 'user123', email: 'user123@test.com')

    expect(current_path).to eq '/'
    expect(page).to have_content(
      'Your account has been successfully created, welcome to Chitter user123!'
    )
  end
  
  # here we are testing the presentation of the error tested in user_spec
  scenario 'user is prevented from signing up with an existing username' do
    sign_up(username: 'user123', email: 'user123@test.com')
    sign_up(username: 'user123', email: 'user456@test.com')

    expect(current_path).to eq '/user/new'
    expect(page).to have_content("That username or email already exists")
  end

  scenario 'user is prevented from signing up with an existing email' do
    sign_up(username: 'user123', email: 'user@test.com')
    sign_up(username: 'user456', email: 'user@test.com')

    expect(current_path).to eq '/user/new'
    expect(page).to have_content("That username or email already exists")
  end
end
