require 'spec_helper'

feature 'Send a peep' do
  before(:each) do
    @user = User.create(name: "Alex",
              username: "AlexHandy1",
              email: "ah.com",
              password: "test",
              password_confirmation: "test"
      )
  end
  scenario 'user sends a peep to website' do #need to test form
    visit ('/')
    @peep = Peep.create(message: "Hello world",
      user_id: @user.id)
    expect(@peep.message).to eq "Hello world"
  end

  xscenario 'non logged in user cannot send a peep to website' do


  end
end