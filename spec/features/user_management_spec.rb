require 'spec_helper'
require './data_mapper_setup'
require './app/models/user'


feature 'Creating peeps' do

  scenario 'I can sign up as a new user' do
    # user = User.new(email: 'retesh@example.com', password: 'retesh', username: 'rets')
    # p user
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, retesh@example.com')
    expect(User.first.email).to eq('retesh@example.com')
  end

  scenario 'signing up as a new user with the same email fails' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
  end


  def sign_up
    visit '/users/new'
    fill_in :email,    with: 'retesh@example.com'
    fill_in :password, with: 'retesh'
    fill_in :username, with: 'rets'
    click_button 'Sign up'
  end


end