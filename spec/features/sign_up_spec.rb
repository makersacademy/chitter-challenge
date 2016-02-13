require './spec/web_helper'

feature 'sign up' do
  scenario 'allows users to create an account' do

    expect {sign_up_good}.to change(User, :count).by(1)
  end
end
