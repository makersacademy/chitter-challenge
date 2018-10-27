# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up for Chitter' do
  # scenario 'A user can get to the registration page' do
  #   visit('/')
  #   click_link('Register for Chitter')
  #    # p URI.parse(current_url)
  #    # p current_path
  #   expect(current_path).to eq "/user/register"
  # end

  scenario 'A user can enter their sign up details' do
    register_user
    expect(page).to have_content "Registration successful"
  end

  scenario 'A user will fail to register with same email address' do
    User.create("Joe", "Bloggs", "peeper1234-test", "p4s5w0rd-test", "test@test.com")
    register_user
    expect(page).to have_content "There is already an account with this email address"
    expect(page).not_to have_content "Welcome to Chitter, peeper1234-test"
  end

  scenario 'A user will fail to register with same username' do
    User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd-test", "test-test@test.com")
    register_user
    expect(page).to have_content "There is already an account with this username"
    expect(page).not_to have_content "Welcome to Chitter, peeper1234"
  end

  scenario 'A user will fail to register with same username AND email' do
    User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test@test.com")
    register_user
    expect(page).to have_content "There is already an account with this username"
    expect(page).to have_content "There is already an account with this email address"
    expect(page).not_to have_content "Welcome to Chitter, peeper1234"
  end
end
