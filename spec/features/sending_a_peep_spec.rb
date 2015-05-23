require 'spec_helper'
require_relative 'helpers/session_helpers'

feature 'Send a peep' do
  include SessionHelper
  before(:each) do
    @user = User.create(name: "Alex",
              username: "AlexHandy1",
              email: "ah.com",
              password: "test",
              password_confirmation: "test"
      )
  end
  scenario 'peeps can be stored on website' do
    visit ('/')
    @peep = Peep.create(message: "Hello world",
      user_id: @user.id)
    expect(@peep.message).to eq "Hello world"
  end

  scenario 'user can send a peep using form when logged in' do
    visit ('/')
    sign_in("ah.com", "test")
    add_peep("Tester")
    expect(page).to have_content("Tester")
  end

  scenario 'non logged in user cannot send a peep to website' do
    expect(page).not_to have_selector("div#peep_button")
  end
end