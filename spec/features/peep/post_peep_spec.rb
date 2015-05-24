require_relative '../helpers/session'
include SessionHelpers

feature 'a user updates his status' do
  scenario 'writing a peep' do
    before(:each) do
      User.create(email: 'test@test.com',
                  password: 'test',
                  password_confirmation: 'test')
    end
    sign_in('test@test.com', 'test')
    expect(page).to have_content('Welcome, test@test.com')
    expect(page).to have_content('Welcome, test@test.com')
  end
end
