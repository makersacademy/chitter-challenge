feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Jack Bauer')
    expect(User.first.email).to eq('jbauer@ctu.com')
  end

  scenario 'requires a matching confirmation password' do
      expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is already taken')
  end

  scenario "I can't sign up without an user name" do
    expect { sign_up(user_name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('User Name must not be blank')
  end

  scenario 'I cannot sign up with an existing user name' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('User Name is already taken')
  end

  scenario "I can't sign up without a name" do
    expect { sign_up(name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Name must not be blank')
  end

end
