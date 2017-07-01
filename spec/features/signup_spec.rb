require_relative '../web_helper'

feature 'Sign up for Chitter' do
  scenario 'sign up for a new account' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Hello, DizzyUnicorn')
    expect(User.first.username).to eq('DizzyUnicorn')
  end

  scenario 'confirm password matches' do
    expect { sign_up(confirm_password: 'rainforest') }.not_to change(User, :count)
  end
end
