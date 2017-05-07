require 'web_helper'

feature 'User sign up' do

  scenario 'user can sign up for a Chitter account' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, chitmeister49')
    expect(User.first.email).to eq('chittychitty@peeppeep.com')
    expect(User.first.name).to eq('John')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'worng') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

end
