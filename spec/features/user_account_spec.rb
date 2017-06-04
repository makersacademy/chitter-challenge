require './spec/web_helper.rb'

feature 'User can sign up' do
  scenario 'User is able to sign up for Chitter' do
    sign_up
    expect(User.first.email).to eq('cat@example.com')
  end
end
