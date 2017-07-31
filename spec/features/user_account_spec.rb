feature 'user accounts' do
  scenario 'user can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Chitter, example@example.com"
    expect(User.first.email).to eq "example@example.com"
  end

  scenario 'user cannot sign up with an incorrect password' do
    expect { sign_up(password_confirmation: 'exanple') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'user needs an email address to sign up' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'user needs a valid email address to sign up' do
    expect {sign_up(email: "rubbish@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "user can't reuse an email to sign up" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content "Email is already taken"
  end
end
