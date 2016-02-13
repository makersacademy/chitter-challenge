require './spec/web_helper'

feature 'sign up' do

  scenario 'allows users to create an account' do
    expect {sign_up_good}.to change(User, :count).by(1)
  end

  scenario 'sends error message when email already used' do
    sign_up_good
    expect {sign_up_good}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
