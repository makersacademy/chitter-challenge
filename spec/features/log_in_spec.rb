
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'log in' do
  # let!(:user) do
  before do
    User.create(name: 'Georgia',
                username: 'grmillsy',
                email: 'g@hotmail.com',
                password: '123',
                password_confirmation: '123')
  end

  scenario 'I can log in' do
    log_in(username: 'grmillsy', password: '123')
    expect(page).to have_content "Hello there, grmillsy"
  end
end
