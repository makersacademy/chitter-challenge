feature 'sign up' do
  scenario 'register as a chitter user' do
    sign_up
    expect(User.first.email).to eq 'test@test.com'
  end
  scenario 'the user\'s information is displayed on the links page' do
    sign_up
    expect(page).to have_content('Welcome, Roxy')
  end
end

feature 'User sign up' do
  scenario 'requires a matching confirmation password' do
    # again it's questionable whether we should be testing the model at this
    # level.  We are mixing integration tests with feature tests.
    # However, it's convenient for our purposes.
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  def sign_up(name: 'Roxy',
              email: 'alice@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Register'
  end
end
