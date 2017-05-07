require 'web_helper'

feature 'User sign up' do
  scenario 'user can sign up for a Chitter account' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, chitmeister49')
    expect(User.first.email).to eq('chittychitty@peeppeep.com')
    expect(User.first.name).to eq('John')
  end
end
