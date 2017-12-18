feature 'Sign up' do
  scenario 'user can sign up to Chitter' do
    expect {sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, George'
    expect(User.first.email).to eq 'example@coldmail.com'
  end

  scenario 'sign up without matching passwords will fail' do
    expect {sign_up(password_confirmation: 'incorrect')}.to change(User, :count).by 0
    expect(page).to have_current_path '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'cannot sign up with a blank email, name, or username' do
    expect {sign_up(email: nil)}.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
    expect {sign_up(name: nil)}.not_to change(User, :count)
    expect(page).to have_content 'Name must not be blank'
    expect {sign_up(username: nil)}.not_to change(User, :count)
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'cannot sign up with an invalid email' do
    expect {sign_up(email: 'invalidemail')}.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'cannot sign up with an already taken email or username' do
    sign_up
    expect {sign_up}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
    expect {sign_up}.not_to change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end
end

feature 'Sign in' do

  let!(:user) do
    User.create(email: 'example@coldmail.com', name: 'George', username: 'Chunks', password: 'password', password_confirmation: 'password')
  end
  scenario 'user can sign in with the correct information' do
    sign_in
    expect(page).to have_content 'Welcome, George'
  end
  scenario 'user cannot sign in with incorrect information' do
    sign_in(password: 'wrong')
    expect(page).not_to have_content 'Welcome, George'
  end
end

feature 'Sign out' do

  before(:each) do
    User.create(email: 'example@coldmail.com', name: 'George', username: 'Chunks', password: 'password', password_confirmation: 'password')
  end
  scenario 'sign in and out' do
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('You have logged out successfully')
    expect(page).not_to have_content('Welcome, George')
  end
end
