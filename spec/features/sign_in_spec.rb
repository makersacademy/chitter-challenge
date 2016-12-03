require './app/app.rb'
require_relative 'web_helper.rb'

feature 'Signing in to Chitter for an existing user' do
  scenario 'User goes to the signin screen and adds an email and password' do

    expect{ sign_in }.to change(User, :count).by(0)
    expect(page).to have_content("Hello Simon")

  end
end
