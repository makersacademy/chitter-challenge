feature 'User signup' do
  scenario 'I want to sign up for Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Name')
    expect(User.first.email).to eq('someone@emailaddress.com')
  end

  context 'Validation errors for signup' do
    scenario 'Requires a matching confirmation password' do
      expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content 'Password does not match the confirmation'
    end

    scenario 'Requires an email address for signup' do
      expect { sign_up(email: nil) }.not_to change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content('Email must not be blank')
    end

    scenario 'Requires a valid email address for signup' do
      expect { sign_up(email: 'someone@wrongemail') }.not_to change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content('Email has an invalid format')
    end

    scenario 'Requires a unique email address' do
      sign_up
      expect { sign_up(username: 'different') }.to_not change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content('Email is already taken')
    end
  end
end
