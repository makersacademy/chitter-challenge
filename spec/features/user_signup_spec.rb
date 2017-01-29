feature 'Signing up' do
  scenario 'as new user increases user count by 1, stores user data in DB, and uses it' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Hi, John Doe!'
    expect(User.first.email).to eq('johndoe@internet.com')
  end

  scenario 'with improper password confirmation yields error' do
    expect { sign_up(password_confirmation: 'otherpassword')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "with no email address yields error" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "with no name yields error" do
    expect { sign_up(name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Name must not be blank')
  end

  scenario "with no username yields error" do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario "with invalid email address yields error" do
    expect { sign_up(email: 'been@drinking') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "with existing email yields error" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario "with existing username yields error" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end
end
