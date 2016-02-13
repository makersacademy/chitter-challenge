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


end
