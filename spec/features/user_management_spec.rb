feature 'User sign up' do

  scenario 'new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, barney@barney.com')
    expect(User.first.email).to eq 'barney@barney.com'
  end

  scenario 'matching password confirmation is required' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'confirmation password doesnt match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'email address field is mandatory' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'email address must have valid format' do
    expect { sign_up(email: 'not@valid') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'existing email cannot register' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
