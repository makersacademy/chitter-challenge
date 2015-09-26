require './spec/factories/user'

feature 'User sign up' do


  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, pip')
    expect(User.first.email).to eq('pip@example.com')
  end

  scenario ' requires a matching comfirmation password' do
    expect { sign_up(password_confirmation: 'wrong_password')}.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
  expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  expect(current_path).to eq('/users/new')
  expect(page).to have_content 'Password does not match the confirmation'
end

  scenario 'I cannot sign up with an existing email' do
  user = build :user
  sign_up_as(user)
  click_button 'Sign up'
  sign_up_as(user)
  expect { click_button('Sign up') }.to change(User, :count).by(0)
  expect(page).to have_content('Email is already taken')
end


  def sign_up(email: 'pip@example.com',
              name: 'Philip Clarke',
              username: 'pip',
              password: 'sausages',
              password_confirmation: 'sausages')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with:  email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_up_as(user)
    visit '/users/new'
    fill_in :email,    with: user.email
    fill_in :name, with: user.name
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation

  end


end
