feature 'User Sign Up' do
  scenario 'can create an account' do
    expect { user_sign_up }.to change { User.count }.by(1)
    expect(page).to have_content('Welcome Deadpool! Chit away!')
  end

  scenario 'fails with invalid email' do
    expect { user_sign_up(email: 'chimichongas.com') }
      .not_to change { User.count }
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'fails with mismatching password' do
    expect { user_sign_up(password_confirmation: 'not password') }
      .not_to change { User.count }
    expect(page).to have_content('Password does not match the confirmation')
  end

  feature 'Required fields' do
    scenario 'full name' do
      expect { user_sign_up(full_name: nil) }.not_to change { User.count }
      expect(page).to have_content('Full name must not be blank')
    end

    scenario 'username' do
      expect { user_sign_up(username: nil) }.not_to change { User.count }
      expect(page).to have_content('Username must not be blank')
    end

    scenario 'email' do
      expect { user_sign_up(email: nil) }.not_to change { User.count }
      expect(page).to have_content('Email must not be blank')
    end

    scenario 'password' do
      expect { user_sign_up(password: nil) }.not_to change { User.count }
      expect(page).to have_content('Password must not be blank')
    end
  end

  feature 'Unique fileds' do
    scenario 'username' do
      user_sign_up(full_name: 'Wilson', email: 'dead@pool.com')
      expect { user_sign_up }.not_to change { User.count }
      expect(page).to have_content('Username is already taken')
    end

    scenario 'email' do
      user_sign_up(full_name: 'Wilson', username: 'Wade')
      expect { user_sign_up }.not_to change { User.count }
      expect(page).to have_content('Email is already taken')
    end
  end
end
