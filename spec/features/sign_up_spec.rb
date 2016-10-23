# require 'spec_helper'
#
# feature 'signs up a new user account' do
#   scenario 'enters email and password and submits form' do
#     visit '/sign_up'
#     fill_in('email', :with => "chitterchatter@makersacademy.co.uk")
#     fill_in('password', :with => "chatter")
#     click_button('Submit')
#     expect(page).to have_content("Welcome chitterchatter@makersacademy.co.uk")
#   end
