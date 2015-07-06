# require './app/models/user'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, salman@test.com')
    expect(User.first.email).to eq 'salman@test.com'
  end

  def sign_up(email: 'salman@test.com', password: 'oranges!', password_confirmation: 'oranges!')
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'requires an email address' do
    expect { sign_up(email: '') }.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Email must not be blank'
  end
end

feature 'User sign in' do

  let(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: (email)
    fill_in :password, with: (password)
    click_button 'Sign in'
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(email:'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  xscenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
