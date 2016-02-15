feature 'Signing up successfully' do
  let(:user) { user = build(:user) }

  scenario 'Successful signing up with valid credentials' do
    expect { sign_up_as(user) }.to change(User, :count).by(1)
    expect(current_path).to eq '/peeps'
  end
end

feature 'Signing up errors' do
  let(:user) { user = build(:user) }

  scenario 'Username already in use, Email already registered' do
    sign_up_as(user)
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Username already in use'
    expect(page).to have_content 'Email already registered'
  end

  scenario 'Missing username' do
    user = build(:user, username: '')
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Please enter a username'
  end

  scenario 'Missing email' do
    user = build(:user, email: '')
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Please enter an email address'
  end

  scenario 'Invalid format for email address' do
    user = build(:user, email: 'invalidemail')
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'Password confirmation mismatch' do
    expect { sign_up_as(user, password_confirmation: 'wrong_password') }.
      to change(User, :count).by(0)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
