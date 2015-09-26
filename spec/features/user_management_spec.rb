require_relative '../../app/data_mapper_setup'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    user.email = 'emily@test.com'
    user.username = 'Emily'
    expect { sign_up_as(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Emily')
  end

  scenario 'requires a matching confirmation password' do
    user = build :user
    user.password_confirmation = 'wrong'
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'has not entered an email address' do
    user = build :user
    user.email = ''
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'I cannot sign up with an existing email' do
    user = create :user
    user.password = 'wrong'
    expect{sign_up_as(user)}.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
    expect(page).to have_content('Password does not match the confirmation')
  end

end

feature 'User sign in' do

  scenario 'with correct credentials' do
    user = create :user
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.username}"
  end

end

feature 'User signs out' do

  scenario 'while being signed in' do
    user = create :user
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content("Welcome, #{user.username}")
  end

end
