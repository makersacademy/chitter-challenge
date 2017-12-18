feature 'User sign up' do
  scenario 'new users can sign up and add username to chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, Lan')
    expect(User.first.email).to eq('lan@example.com')
    expect(User.first.username).to eq('Lan')
    expect(User.first.name).to eq('Lan Pham')
  end

  scenario 'asking user to confirm their password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'show error message if password does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "unable to sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "unable to sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'unable to sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
