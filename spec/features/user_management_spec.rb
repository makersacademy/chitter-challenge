require_relative '../factories/user'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up_as(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, foo@bar.com')
    expect(User.first.email).to eq('foo@bar.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build :user
    user.password_confirmation = 'wrong'
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    user = build :user
    user.password_confirmation = 'wrong'
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'with an empty email field' do
    user = build :user
    user.email = nil
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  def sign_up_as(user)
    visit '/users/new'
    fill_in :email,     with: user.email
    fill_in :password,  with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  def sign_in_as(user)
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

end
