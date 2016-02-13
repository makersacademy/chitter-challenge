require './app/app.rb'
require 'spec_helper'


feature 'User Sign Up' do

  scenario 'There is a sign up option on Chitter\'s home page' do
    visit '/'
    expect(page).to have_content('Join the Cult')
    expect(page).to have_button('Bizarre Initiation Ceremony This Way')
  end

  scenario 'On sign up I see a personalized welcome message' do
    sign_up_good
    expect(page).to have_content("Welcome to Chitter Le Jockey")
  end

  scenario 'On sign up my details are added to the database' do
    expect{sign_up_good}.to change(User, :count).by(1)
  end

  scenario 'On sign up, if my passwords do not match I am served a message' do
    sign_up_bad_password
    expect(page).to have_content('Dur-brain, you need to type the SAME password twice')
  end

  scenario 'On sign up, if my passwords do not match I am not added to the database' do
    expect{sign_up_bad_password}.not_to change(User, :count)
  end

  scenario 'On sign up, I need to enter a unique email address' do
    expect{sign_up_bad_email}.to change(User, :count).by(1)
    expect(page).to have_content('Friend? Can you not remember that you\'re a member?')
  end

  scenario 'On sign up, I need to enter a unique username' do
    expect{sign_up_bad_username}.to change(User, :count).by(1)
    expect(page).to have_content('We already have a Brother by that name. There can be only one')
  end


end
