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
    expect(page).to have_content "Thank you for registering"
  end
end
