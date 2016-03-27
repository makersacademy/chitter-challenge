require 'spec_helper'

feature 'can sign up' do

  scenario 'I can enter my email address' do
    visit '/users/new'
    fill_in :email, with: 'adam@adam.com'
    fill_in :password, with: 'adampw'
    fill_in :name, with: 'adam'
    fill_in :username, with: 'adamu'
    expect { click_button 'Create account' }.to change(User, :count).by(1)    
   end

  scenario 'cannot sign up without including all details' do
    visit '/users/new'
    fill_in :password, with: 'adampw'
    fill_in :username, with: 'adamu'
    expect { click_button 'Create account' }.to_not change(User, :count)
  end
    
  scenario 'cannot sign in with invalid email' do
    visit '/users/new'
    fill_in :email, with: 'adam@amdam'
    fill_in :password, with: 'adampw'
    fill_in :name, with: 'adam'
    fill_in :username, with: 'adamu'
    expect { click_button 'Create account' }.to_not change(User, :count)
  end
end

    
