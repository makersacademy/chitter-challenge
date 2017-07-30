feature 'User: Sign up' do

  let!(:user) do
    User.create(email: 'user@user.com', password: 'password', username: '@user')
  end

  # I want to sign up for Chitter
  scenario 'can sign up a new user' do
    visit '/users/new'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, @user'
    expect(User.first.email).to eq 'user@user.com'
  end

  # When a password does not match
  scenario 'cannot sign up without a matching password' do
    expect { sign_up(password_confirmation: 'no') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  # Form fields
  scenario 'cannot sign up without and email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'cannot sign up with an invalid email address' do
    expect { sign_up(email: "user@user") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'cannot sign up with the same email twice' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is already taken')
  end

  scenario 'cannot sign up without a username' do
    expect { sign_up(username: '@user') }.to change(User, :count).by(1)
    expect(User.first.username).to eq '@user'
  end

  scenario 'cannot sign up with the same username twice' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username is already taken')
  end
end
