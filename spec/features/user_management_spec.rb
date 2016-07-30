
feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to(have_content("Hello, jsmith"))
    expect(User.first.email).to(eq("john.smith@example.com"))
  end

  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: "wrong") }.not_to(change(User, :count))
  end

  scenario 'with an incorrect password confirmation' do
    sign_up(password_confirmation: "Wrong")
    expect(current_path).to(eq('/users'))
    expect(page).to(have_content("Password does not match the confirmation"))
  end

  scenario 'sign up without name' do
    expect { sign_up(name: nil) }.not_to(change(User, :count))
  end

  scenario 'sign up without email' do
    expect { sign_up(email: nil) }.not_to(change(User, :count))
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'sign up without a valid email' do
    expect { sign_up(email: "invalid@email") }.not_to(change(User, :count))
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'sign up without username' do
    expect { sign_up(username: nil) }.not_to(change(User, :count))
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'sign up without password' do
    expect { sign_up(password: nil, password_confirmation: nil) }.not_to(change(User, :count))
    expect(page).to have_content('Password must not be blank')
  end

  scenario 'cannot sign up with existing email' do
    sign_up
    expect { sign_up(username: 'johnsmith') }.not_to(change(User, :count))
    expect(page).to have_content('Email is already taken')
  end

  scenario 'cannot sign up with existing username' do
    sign_up
    expect { sign_up(email: "test@test.com") }.not_to(change(User, :count))
    expect(page).to have_content('Username is already taken')
  end

end
