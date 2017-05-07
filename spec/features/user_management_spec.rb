require 'web_helper'

feature 'User sign up' do

  scenario 'user can sign up for a Chitter account' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, chitmeister49')
    expect(User.first.email).to eq('chittychitty@peeppeep.com')
    expect(User.first.name).to eq('John')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario "sign up requires an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "sign up email address must be valid" do
    expect { sign_up(email: "not an email address") }.not_to change(User, :count)
  end

end
