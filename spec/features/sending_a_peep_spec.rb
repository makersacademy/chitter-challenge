require 'spec_helper'
require_relative 'helpers/session_helpers'

feature 'Send a peep' do
  include SessionHelper
  before(:each) do
    @user1 = User.create(name: "Alex",
              username: "AlexHandy1",
              email: "ah.com",
              password: "test",
              password_confirmation: "test"
      )
    @user2 = User.create(name: "Jack",
              username: "Jack2",
              email: "jack.com",
              password: "test2",
              password_confirmation: "test2"
      )
  end
  scenario 'and peep can be stored on website' do
    visit ('/')
    @peep = Peep.create(message: "Hello world",
      user_id: @user1.id)
    expect(@peep.message).to eq "Hello world"
  end

  scenario 'and user can send a peep using form when logged in' do
    visit ('/')
    sign_in("ah.com", "test")
    add_peep("Tester")
    expect(page).to have_content("Tester")
  end

  scenario 'and non logged in user cannot send a peep to website' do
    expect(page).not_to have_selector("div#peep_button")
  end

  scenario 'in reply to another user' do
    Peep.create(message: "Hello world",
      user_id: @user2.id)
    visit('/')
    sign_in("ah.com", "test")
    reply("Hi there Jack")
    expect(page).to have_content("@Jack2:Hi there Jack")
  end

  scenario 'and should not be able to reply unless logged in' do
    expect(page).not_to have_selector("li#reply")
  end
end








