feature 'sign up a new user' do
  scenario 'successfully sign up a new user and show welcome message' do
    sign_up
    expect(page).to have_content("Welcome, Bob McBob!")
  end

  scenario 'successfully sign up a new user and create new user' do
    expect{ sign_up }.to change(User, :count).by(1)
  end

  scenario 'fail to sign up without entering all fields' do
    visit '/'
    click_link 'Sign up'
    fill_in 'email', with: 'bob@bob.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    fill_in 'user_name', with: 'bob'
    expect{ click_button('Sign up') }.not_to change(User, :count)
  end

  scenario 'requires a matching confirmation password' do
    visit '/'
    click_link 'Sign up'
    fill_in 'email', with: 'bob@bob.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'wrong_password'
    fill_in 'user_name', with: 'bob'
    fill_in 'real_name', with: 'Bob McBob'
    expect { click_button('Sign up') }.not_to change(User, :count)
  end

end
