feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, marco@example.com'
    expect(User.first.email).to eq 'marco@example.com'
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end

feature 'User sign in' do
  let(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  feature 'User signs out' do
    before(:each) do
      User.create(email: 'test@test.com',
                  password: 'test',
                  password_confirmation: 'test')
    end

    scenario 'while being signed in' do
      sign_in(email: 'test@test.com', password: 'test')
      click_button 'Sign out'
      expect(page).to have_content('goodbye!')
      expect(page).not_to have_content('Welcome, test@test.com')
    end
  end

  feature 'Resetting Password' do
    scenario 'When I forget my password I can see a link to reset' do
      visit '/sessions/new'
      click_link 'I forgot my password'
      expect(page).to have_content("Please enter your email address")
    end

    scenario 'When I enter my email I am told to check my inbox' do
      recover_password
      expect(page).to have_content "Thanks, Please check your inbox for the link."
    end

    scenario 'assigned a reset token to the user when they recover' do
      sign_up
      expect{recover_password}.to change{User.first.password_token}
    end
  end
end
