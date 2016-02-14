require 'spec_helper'
require 'web_helpers'
require './app/chitter.rb'

feature 'Sigin in' do

  before do
    sign_up
  end

  scenario 'I can sign in using my username, name, password and email' do
    sign_in
    expect(current_path).to eq '/'
    expect(page).to have_content('Welcome, Rachel')
  end

  scenario 'I cannot sign in if my login details are incorrect - name' do
    sign_in_wrong_name
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The name, username, email or password is incorrect'
    expect(page).not_to have_content 'New peep'
  end

  scenario 'I cannot sign in if my login details are incorrect - username' do
    sign_in_wrong_usernname
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The name, username, email or password is incorrect'
    expect(page).not_to have_content 'New peep'
  end

  scenario 'I cannot sign in if my login details are incorrect - email' do
    sign_in_wrong_email
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The name, username, email or password is incorrect'
    expect(page).not_to have_content 'New peep'
  end

  scenario 'I cannot sign in if my login details are incorrect - password' do
    sign_in_wrong_pw
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The name, username, email or password is incorrect'
    expect(page).not_to have_content 'New peep'
  end


end
