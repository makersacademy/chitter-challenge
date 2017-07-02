require_relative '../web_helper'

feature 'Sign up for Chitter' do
  scenario 'sign up for a new account' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Hello, DizzyUnicorn')
    expect(User.first.username).to eq('DizzyUnicorn')
  end

  scenario 'confirm passwords don\'t match' do
    expect { sign_up(confirm_password: 'rainforest') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Passwords do not match')
  end
end
