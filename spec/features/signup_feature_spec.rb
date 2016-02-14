require 'spec_helper'


feature 'User Sign Up' do

  scenario 'There is a sign up option on Chitter\'s home page' do
    visit '/'
    expect(page).to have_content('Join the Cult')
    expect(page).to have_button('Bizarre Initiation Ceremony This Way')
  end

  scenario 'On sign up I\'m welcomed and I\'m added to the database' do
    expect{sign_up_good}.to change(User, :count).by(1)
    expect(current_path).to eq '/welcome'
    expect(page).to have_content("Welcome to Chitter Le Jockey")
  end


  scenario 'Sign up, I am alerted of mismatched password and not added to db' do
    expect{sign_up_bad_password}.not_to change(User, :count)
    expect(page).to have_content('Dur-brain, you need to type the SAME password twice')
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
