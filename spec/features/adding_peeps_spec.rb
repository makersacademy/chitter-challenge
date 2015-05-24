require 'spec_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'User can' do


  before(:each) do
    @user = User.create(:firstname => 'Anna',
              :surname => 'Klimas',
              :username => 'ania2ab',
              :email => 'anna@klimas.com',
              :password => 'apple',
              :password_confirmation => 'apple')
  end

  scenario 'add peeps' do
    expect(Peep.count).to eq(0)
    sign_in("anna@klimas.com", "apple")
    visit '/'
    add_peep('This is my first peep', 'ania2ab')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq("This is my first peep")
  end

  scenario 'can see peeps when not logged' do
    visit ('/')
    @peep = Peep.create(message: "Hello world",
      user_id: @user.id)
    expect(@peep.message).to eq "Hello world"
  end
end