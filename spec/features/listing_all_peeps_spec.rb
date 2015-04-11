require 'spec_helper'

feature 'Feature - Chitter Homepage' do

  before(:each) do
    Peep.create message: 'My first peep',
                user_name: 'Sanjay Purswani',
                user_handle: 'sanjsanj'

    Peep.create message: "Bob's first peep",
                user_name: 'Bob Smith',
                user_handle: 'bob'
  end

  after(:each) do
    Peep.each(&:destroy)
  end

  scenario 'lists all peeps' do
    visit '/'
    expect(page).to have_content "My first peep by @sanjsanj (Sanjay Purswani)"
    expect(page).to have_content "Bob's first peep by @bob (Bob Smith)"
  end

end
