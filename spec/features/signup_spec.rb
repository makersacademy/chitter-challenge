# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up for Chitter' do

  # As a Maker
  # So that I can sign up for Chitter
  # I want to see the welcome page 
  scenario 'I want to visit the welcome page' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end
  
  # As a Maker
  # So that I can sign up for Chitter
  # I want to enter my name, username, email and password
  scenario 'I want to sign up as a new user with my name, username, email and password' do
    visit '/'
    within 'div .signup' do
      expect { sign_up }.to change { User.count }.by(1)
    end
  end
  
  scenario 'I cannot sign up when confirmation password does not match' do
    visit '/'
    within 'div .signup' do
      expect { sign_up(password_confirmation: 'wrong') }.not_to change { User.count }
    end
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'I cannot sign up without an email address' do
    visit '/'
    within 'div .signup' do
      expect { sign_up(email: '') }.not_to change { User.count }
    end
    expect(current_path).to eq '/users' 
  end

  scenario 'I cannot sign up with an invalid email address' do
    visit '/'
    within 'div .signup' do
      expect { sign_up(email: 'invalid@email') }.not_to change { User.count }
    end
    expect(current_path).to eq '/users' 
  end

  scenario 'I cannot sign up with an email that is already registered' do
    visit '/'
    within 'div .signup' do
      sign_up(email: 'jackie@zmail.org')
      sign_up(email: 'jackie@zmail.org')
    end
    expect(page).to have_content 'Email is already taken'
  end
end

