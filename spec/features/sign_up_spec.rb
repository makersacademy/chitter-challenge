require './spec/web_helper'

feature 'register user' do
  scenario 'I can sign up as a new user' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(User.first.email).to eq 'pat@test.com'
  end
end

feature 'requires maching password' do

    scenario 'passwords do not match' do
      expect{ sign_up( password_confirmation: 'wrong') }.not_to change(User, :count)
      expect(current_path).to eq '/users/new'
    end

    scenario 'returns an error message' do
      sign_up( password_confirmation: 'wrong')
      expect(page).to have_content "Password and confirmation password do not match"
    end

    scenario 'email address cannot by blank' do
      expect{ sign_up( email: '') }.not_to change(User, :count)
      expect(current_path).to eq '/users/new'
    end

    scenario 'user cannot sign up with invalid email address' do
      expect{ sign_up( email: 'shane.com') }.not_to change(User, :count)
      expect(current_path).to eq '/users/new'
    end
end
