require 'spec_helper'

feature 'Sign up' do

  scenario 'a user can sign up' do
    expect{ sign_up('abigail', 'abi@test.com', 'abimcp', 'password123') }.to change{ User.count }.by 1
    expect(User.first.email).to eq 'abi@test.com'
    expect(page).to have_content 'Welcome, Abigail!'
  end

end
