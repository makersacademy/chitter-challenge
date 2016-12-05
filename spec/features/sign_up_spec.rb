require './app/app.rb'
require_relative 'web_helper.rb'

feature 'Signing up to Chitter' do
  scenario 'User goes to the signup screen and adds a name, email and password' do

    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Hello Simon")
    expect(User.first.email).to eq("simon.conway@condaal.com")

  end
end
