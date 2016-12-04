require 'spec_helper.rb'
require 'web_helpers.rb'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('test@example.com')
  end
end
