feature 'sign up' do

  scenario 'user signs up succesfully' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Wizard_Trish')
    expect(User.first.email).to eq 'Trisha@person.com'
  end

  scenario 'cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'cannot sign up with an invalid email' do
    expect { sign_up(email: 'invalid@invalid') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'cannot sign up with existing email address' do
    sign_up
    expect { sign_up(username: 'Muggle_Trish') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is already taken')
  end

  scenario 'cannot sign up with existing username' do
    sign_up
    expect { sign_up(email: 'Ben@person.com') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username is already taken')
  end

  scenario 'cannot sign up without username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'incorrect') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  def sign_up(email: 'Trisha@person.com',
              username: 'Wizard_Trish',
              password: 'password',
              password_confirmation: 'password')
    visit '/users/new'
    fill_in(:name, with: 'Trisha')
    fill_in(:email, with: email)
    fill_in(:username, with: username)
    fill_in(:password, with: password)
    fill_in(:password_confirmation, with: password_confirmation)
    click_button('Sign up')
  end

end
