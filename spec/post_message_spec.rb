require 'web_helper'

feature 'post messages to chitter' do

  scenario 'post a message' do
   sign_up
   fill_in 'message', with: 'Look at what I\'m doing!'
   click_button 'Post'
   expect(page).to have_content('Look at what I\'m doing!')
  end
end
