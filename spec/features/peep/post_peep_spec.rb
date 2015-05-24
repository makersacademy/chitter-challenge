require_relative '../helpers/session'
include SessionHelpers

feature 'a user updates his status' do
  before(:each) do
      User.create(email: 'test@test.com',
                  password: 'test',
                  password_confirmation: 'test',
                  username: 'john78')
  end
  scenario 'writing a peep' do

    sign_in('test@test.com', 'test')
    expect(page).to have_content('Welcome, john78')
    expect(page).to have_content('Welcome, john78')
  end
end
