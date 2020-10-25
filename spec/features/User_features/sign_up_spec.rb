require 'web_helper'

feature 'create a user' do
  scenario 'a user can sign up to Chitter' do
    sign_up    
    expect(page).to have_content "What's happening harrypotter!?"
  end
end
