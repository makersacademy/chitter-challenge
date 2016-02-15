require 'spec_helper'
require 'data_mapper'


feature 'signing up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome in chitter')
    expect(current_path).to eq('/users/welcome')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'I cannot sign up with an existing username' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(current_path).to eq('/users/failed')
    expect(page.status_code).to eq(200)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(current_path).to eq('/users/failed')
    expect(page.status_code).to eq(200)
  end


end


def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'aliali'
  fill_in :name,    with:  'alice'
  fill_in :username, with: 'alice82'
  click_button 'Sign up'
end