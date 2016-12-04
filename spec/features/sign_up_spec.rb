require 'spec_helper'

require './app/app.rb'



feature 'sign up' do

    # let!(:user) do
    #   User.create(name: 'Bob',
    #   username: 'Bobmcbobface',
    #   email: 'bob@bob.com',
    #   password: 'pwd')
    # end

  scenario 'user can sign up for chitter' do
    sign_up
    expect(page).to have_content("Welcome, bob@bob.com")
    expect(User.first.email).to eq("bob@bob.com")
  end

  scenario 'duplicate email'do
   sign_up
   expect(User.count).to eq(1)
   expect{ sign_up }.to change(User, :count).by(0)
   expect(page).to have_content("We already have that email")
  end

  scenario "I can't sign up without an email address" do
     expect { sign_up(email: nil) }.not_to change(User, :count)
   end

end
