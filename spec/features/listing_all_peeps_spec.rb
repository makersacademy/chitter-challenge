require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User browses the list of peeps' do

  before(:each) do
    sign_up
    add_peep('Hello, Chatter')
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('Hello, Chatter')
  end

  scenario
end

