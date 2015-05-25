require 'spec_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'User adds a new peep' do
  scenario 'when browsing the homepage' do
    sign_up
    expect(Message.count).to eq(0)
    visit '/'
    add_peep('Hello, Chatter!')
    expect(Message.count).to eq(1)
    message = Message.first
    expect(message.peep).to eq('Hello, Chatter!')
  end


end
