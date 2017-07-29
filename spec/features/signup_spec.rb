require 'web_helper'

feature 'Sign Up to Chitter' do

  scenario 'new user can sign up' do
    sign_up
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome Cat_Peeps93!'
  end

  scenario 'username/email must be unique' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Username is already taken'
    expect(page).to have_content 'Email is already taken'
  end

end
