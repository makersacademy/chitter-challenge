# User Story Two
#
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'logging in' do
  before do
    User.create(
      name:                   'Test User Name',
      email:                  'test@test.com',
      password:               'qwerty',
      password_confirmation:  'qwerty')
  end

  scenario 'if user exists he can log in' do
    log_in_existing_user
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, Test User Name!'
  end
  scenario 'if user does not exist error is raised and he is referred to sign_up' do
    log_in_non_existing_user
    expect(current_path).to eq '/'
    expect(page).to have_content 'The email or password is incorrect. If you have not regitered with us yet, please follow the link to sign up page.'
  end

end
