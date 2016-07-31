# User Story 3
# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter


feature 'Log out' do

# Use a let block instead as an experiment and sign_in below with user.email, user.password
  let(:user) do
    User.create(username: 'Jonny',
                email: 'jonny@email.com',
                password: 'somepassword',
                password_confirmation: 'somepassword')
  end

end
