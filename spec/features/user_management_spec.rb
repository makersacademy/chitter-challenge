require_relative '../factories/user'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(User.first.email).to eq('foo@bar.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build :baduser
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    user = build :baduser
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do
    user = build :user
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an existing username' do
    user = build :user
    user2 = build :username
    sign_up(user)
    expect { sign_up(user2) }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end
end

  feature 'User sign in' do
    scenario 'with correct credentials' do
      user = build :user
      sign_up(user)
      expect(page).to have_content "Welcome"
    end

    scenario 'with incorrect credentials' do
      visit ('/sessions/new')
      fill_in 'email', with: 'today is saturday'
      fill_in 'password', with: 'today is saturday'
      click_button 'Sign in'
      expect(page).to have_content "The email or password is incorrect"
    end
  end

  feature 'User signs out' do

    let(:user) do
      User.create(email: 'test@test.com', username: 'foo',
                  password: 'test',
                  password_confirmation: 'test')
    end

    scenario 'while being signed in' do
      sign_in(email: 'test@test.com', password: 'test')
      click_button('Sign out')
      expect(page).to have_content('Goodbye!')
    end
  end
