require './spec/web_helper'

feature 'Sign up' do
  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, test1!')
    expect(User.first.email).to eq('test1@test.com')
  end
end


