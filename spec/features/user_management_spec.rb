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
    expect(page).to have_content 'Please refer to the errors listed below:'
  end

  scenario 'with an empty email field' do
    user = build :user
    user.email = nil
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    user = build :user
    sign_up_as(user)
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
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

end

feature 'User signs out' do

  let(:user) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
