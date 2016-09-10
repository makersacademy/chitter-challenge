require 'spec_helper'

feature 'Sign up' do

  scenario 'a potential user can sign up' do
    expect{ sign_up('abigail', 'abi@test.com', 'abimcp', 'password123', 'password123') }.to change{ User.count }.by 1
    expect(User.first.email).to eq 'abi@test.com'
    expect(page).to have_content 'Welcome, Abigail!'
  end

  scenario 'a potential user must confirm their password' do
    expect{ sign_up('abigail', 'abi@test.com', 'abimcp', 'password123', 'password456') }.not_to change{ User.count }
    expect(User.first).to be_nil
    expect(current_path).to eq '/users/new'
    expect(page).not_to have_content 'Welcome, Abigail!'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'a potential user must enter a correctly formatted email' do
    expect{ sign_up('abigail', 'abitest.com', 'abimcp', 'password123', 'password123') }.not_to change{ User.count }
  end

end
