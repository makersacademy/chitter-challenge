feature "Users sign-up" do
  scenario 'user count increases when a user signs up' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, fredb"
    expect(User.first.email).to eq "fred@bloggs.com"
  end

  scenario 'user cannot sign up without a user name' do
    expect { sign_up(user_name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('User name must not be blank')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'user cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "user cannot sign up with an already registered email address" do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

end
