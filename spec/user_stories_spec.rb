# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Sign up' do
  scenario 'display welcome message to new users' do
    sign_up
    expect(page).to have_content('Welcome chuck')
  end

  scenario 'increase user count by one upon sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
  end

  scenario 'password does not match password confirmation' do
      expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
      expect(current_path).to eq('/sign_up') # current_path is a helper provided by Capybara
      expect(page).to have_content 'Password does not match the confirmation'
    end

  scenario 'A user cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'A user cannot sign up with an email that is already registered' do
    sign_up
    visit '/sign_up'
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email already registered mate')
  end
end
