require 'spec_helper'

feature 'Viewing poops' do


  scenario 'I can see existing poops on the poops page' do
    visit 'users/new'
    fill_in :email, with: 'adam@adam.com'
    fill_in :password, with: 'adampw'
    fill_in :name, with: 'adam'
    fill_in :username, with: 'adamu'
    click_button 'Create account'
    click_button 'Do a poop'
    fill_in :poop_msg, with: 'first poop'
    click_button 'Poop' 
    expect(page).to have_content 'first poop'
    expect(page).to have_content 'adam'
    expect(page).to have_content 'adamu'
  end
end

