require './spec/web_helper'

feature 'User management' do
  scenario 'I can sign up to Chitter' do
    expect { sign_up }.to change(User, :count).by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome to Chitter, Lucas"
    expect(User.first.username).to eq 'Lucas'
  end

  scenario 'checks passwords match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password and confirmation password do not match'
  end

end
