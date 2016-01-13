feature 'User Sign Up' do
  scenario 'can create an account' do
    expect { user_sign_up }.to change{ User.count }.by(1)
    expect(page).to have_content('Welcome Deadpool! Chit away!')
  end

  scenario 'fails with no full name' do
    expect { user_sign_up(full_name: nil) }.
    not_to change{ User.count }
  end

  scenario 'fails with no username' do
    expect { user_sign_up(username: nil) }.
    not_to change{ User.count }
  end

  scenario 'fails with no email' do
    expect { user_sign_up(email: nil) }.
    not_to change{ User.count }
  end

  scenario 'fails with no password' do
    expect { user_sign_up(password: nil) }.
    not_to change{ User.count }
  end

  scenario 'password must be confirmed' do
    expect { user_sign_up(password_confirmation: 'not password') }.
    not_to change{ User.count }
  end
end