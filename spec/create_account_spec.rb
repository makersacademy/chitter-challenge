require_relative './web_helpers'

feature 'creating user accounts' do
  scenario 'I should be able to create a user account' do
    expect{sign_in}.to change{User.count}.by 1
    expect(User.first.email).to eq('mike@aol.com')
    expect(User.first.username).to eq('SexyClownfish')
  end
end
