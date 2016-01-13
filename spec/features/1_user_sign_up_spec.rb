feature 'User Sign Up' do
  scenario 'can create an account' do
    expect { user_sign_up }.to change{ User.count }.by(1)
    expect(page).to have_content('Welcome Deadpool! Chit away!')
  end

  scenario 'fails with invalid email' do
    expect { user_sign_up(email: 'chimichongas.com') }.
    not_to change{ User.count }
  end

  scenario 'fails with mismatching password' do
    expect { user_sign_up(password_confirmation: 'not password') }.
    not_to change{ User.count }
  end

  feature 'Required fields' do
    scenario 'full name' do
      expect { user_sign_up(full_name: nil) }.
      not_to change{ User.count }
    end

    scenario 'username' do
      expect { user_sign_up(username: nil) }.
      not_to change{ User.count }
    end

    scenario 'email' do
      expect { user_sign_up(email: nil) }.
      not_to change{ User.count }
    end

    scenario 'password' do
      expect { user_sign_up(password: nil) }.
      not_to change{ User.count }
    end
  end

  feature 'Unique fileds' do
    scenario 'username' do
      user_sign_up(full_name: 'Wilson', email: 'dead@pool.com')
      expect { user_sign_up }.not_to change{ User.count }
    end

    scenario 'email' do
      user_sign_up(full_name: 'Wilson', username: 'Wade')
      expect { user_sign_up }.not_to change{ User.count }
    end
  end
end







