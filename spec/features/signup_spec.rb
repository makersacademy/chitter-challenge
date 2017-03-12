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
end
