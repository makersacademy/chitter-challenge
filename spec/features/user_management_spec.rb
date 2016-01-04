require 'web_helper'
require 'spec_helper'

feature 'User sign up' do
  scenario 'requires a matching confirmation password' do

    expect { sign_up(passwordconf: 'wrong') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    expect { sign_up(passwordconf: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
