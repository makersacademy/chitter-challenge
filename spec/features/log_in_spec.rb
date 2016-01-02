# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Client logs in' do
  scenario 'with correct credentials' do
    sign_up
    log_in(email: 'test@email.com', password: 'secret_password')
    expect(page).to have_content 'Welcome, nickname'
  end
end
