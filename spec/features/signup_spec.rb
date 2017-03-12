# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up/sign in' do

  scenario 'user can sign into Chitter' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign in')
  end

  scenario 'user can create account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome to Chitter! A confirmation email has been sent to john.smith@yournamedomain.co.uk'
    expect(User.first.email).to eq 'john.smith@yournamedomain.co.uk'
  end

  scenario 'user must use an email address for signup' do
    visit '/signup'
    fill_in :email, with: nil
    fill_in :password, with: 'football'
    fill_in :password_confirmation, with: 'football'
    expect { click_button 'Create account' }.not_to change(User, :count)
  end

  scenario 'user must provide a valid email address' do
    visit '/signup'
    fill_in :email, with: 'tony@something'
    fill_in :password, with: 'football'
    fill_in :password_confirmation, with: 'football'
    expect { click_button 'Create account' }.not_to change(User, :count)
  end

  scenario 'prevent signup with existing email address' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

  scenario 'prevent signup when passwords do not match' do
    visit '/signup'
    fill_in 'email', with: 'john.smith@yournamedomain.co.uk'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: 'wrong'

    expect { click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Password does not match the confirmation'
    # expect(current_path).to eq('/signup') # current_path is a helper provided by Capybara
  end

end
