require 'helpers/sign_up_helper'

feature 'user sign up' do

  scenario 'a user signs up so they can post messages' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq '/user/start'
    expect(page).to have_content "We're glad you've joined us, Tim."
  end

end
