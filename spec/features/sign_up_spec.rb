feature 'Signing up' do
  scenario 'A new user can sign up for Chitter' do
    expect { sign_up }.to change(User, :count).by 1

    user = User.last
    expect(user.name).to eq 'George'
    expect(user.email).to eq 'george@curious.com'
    expect(user.username).to eq '@george'

    expect { user.password }.to raise_exception NoMethodError

    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome to Chitter, George"
  end

  scenario 'A new user cannot sign up without a name' do
    expect { sign_up(name: "") }.not_to change(User, :count)
    expect(page).to have_content "Name must not be blank"
  end

  scenario 'A new user cannot sign up without an email' do
    expect { sign_up(email: "") }.not_to change(User, :count)
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'A new user cannot sign up with an invalid email' do
    expect { sign_up(email: "george.com") }.not_to change(User, :count)
    expect { sign_up(email: "george@curious") }.not_to change(User, :count)
    expect(page).to have_content "Email has an invalid format"
  end

  scenario 'A new user cannot sign up without a username' do
    expect { sign_up(username: "") }.not_to change(User, :count)
    expect(page).to have_content "Username must not be blank"
  end

  scenario 'A new user cannot sign up with mismatch in passwords' do
    expect { sign_up(password: "yellow", password_confirmation: "hat") }
    .not_to change(User, :count)
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'A user cannot sign up with existing email' do
    sign_up
    expect { sign_up(username: 'curious') }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end

  scenario 'A user cannot sign up with existing username' do
    sign_up
    expect { sign_up(email: 'curious@george.com') }.not_to change(User, :count)
    expect(page).to have_content "Username is already taken"
  end

end
