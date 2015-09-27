require_relative '../factories/user'
require_relative '../helpers/session'

feature 'User sign up' do
  scenario  'can sign up as a new user' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, Catherine Stevenson')
    expect(User.first.name).to eq('Catherine Stevenson')
  end

  scenario 'requires a matching confirmation password' do
    user = build :baduser
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'requires a password that matches' do
    user = build :baduser
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'cannot sign up with an existing email' do
    user = build :user
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'cannot sign up with an existing username' do
    user = build :user
    user2 = build :username
    sign_up(user)
    expect { sign_up(user2) }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end

end
