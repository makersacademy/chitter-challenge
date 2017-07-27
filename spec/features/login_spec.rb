require_relative '../web_helpers'

feature 'login with email and password' do
  scenario 'I can sign up as a new user' do
    sign_up
    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome, test@aol.com"
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@aol.com')
    expect(User.first.email).to eq('test@aol.com')
  end
end
