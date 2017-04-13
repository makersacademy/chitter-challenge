require 'helpers/session'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Nemo123')
    expect(User.first.email).to eq ('clownfish@keepswimming.com')
  end

  scenario 'I cannot sign up with an existing email or username' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content("Email is already taken")
    expect(page).to have_content("Username is already taken")
  end
end
