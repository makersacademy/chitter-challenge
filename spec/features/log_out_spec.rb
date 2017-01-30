require 'web_helper'

feature "Log Out" do

before(:each) do
  User.create(email: '92jackhenderson@gmail.com',
              password: 'secret1234',
              password_confirmation: 'secret1234',
              name: 'Jack Henderson',
              user_name: 'art_ful_gar_funk')
            end

scenario 'while being signed in' do
     sign_up(email: 'test@test.com', password: 'test',password_confirmation: 'test', name: 'Jack Henderson', user_name: 'art_ful_gar_funk')
     click_button 'Log out'
     expect(page).to have_content('goodbye!')
     expect(page).not_to have_content('Welcome, test@test.com')
 end

 end
