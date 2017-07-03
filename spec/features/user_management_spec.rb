feature 'adding a user' do
  scenario 'I can sign up a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome jsmith')
    expect(User.first.email).to eq('johnsmith@aol.com')
  end

  scenario "I can't sign up without a matching password confirmation" do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up without a first name" do
    expect { sign_up(firstname: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Firstname must not be blank')
  end

  scenario "I can't sign up without a last name" do
    expect { sign_up(lastname: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Lastname must not be blank')
  end

  scenario "I can't sign up without a username" do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario "I can't sign up with an invalid email format" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "I cannot sign up with an existing email" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')

  end

  scenario "I cannot sign up if username is taken" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end


end
