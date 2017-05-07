feature 'New user signs up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Welcome, Frodo Baggins'
    expect(User.first.name).to eq 'Frodo Baggins'
  end

  scenario 'Gets password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "Can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "Can't sign up with an invalid email addy" do
    expect { sign_up(email: 'invalidemail.com') }.not_to change(User, :count)
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario "Can't sign up with a preregisterd email addy" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
