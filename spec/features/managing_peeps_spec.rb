require 'spec_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'User can' do


  before(:each) do
    @user = User.create(:name => 'Anna Klimas',
              :username => 'ania2ab',
              :email => 'anna@klimas.com',
              :password => 'apple',
              :password_confirmation => 'apple')
    @peep = Peep.create(message: 'Hello world',
      user_id: 'ania2ab', created_at: 'Time.new.strftime("%F %H:%M")')

  end

  scenario 'add peeps' do
    expect(Peep.count).to eq(0)
    sign_in("anna@klimas.com", "apple")
    visit '/'
    click_link 'Click to add new peep'
    add_peep('This is my first peep')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq("This is my first peep")
  end
  scenario 'see peeps in reversed order' do
    expect(Peep.count).to eq(0)
    sign_in("anna@klimas.com", "apple")
    visit '/'
    click_link 'Click to add new peep'
    add_peep('This is my first peep')
    click_link 'Click to add new peep'
    add_peep('This is my second peep')
    click_link 'Click to add new peep'
    add_peep('This is my third peep')
    expect(page).to have_selector('li:first-child', :text => "This is my third peep")
  end

  scenario 'cannot add the peep when not logged' do
    visit '/'
    expect(page).not_to have_content('Click to add new peep')
  end


  scenario 'can see peeps when not logged' do
    visit ('/')
    expect(@peep.message).to eq "Hello world"
  end

  scenario 'can see username of the person who posted a peep' do
    visit('/')
    expect(@peep.user_id).to eq 'ania2ab'
  end

  scenario 'can see the time when peep was posted' do
   visit('/')
   expect(@peep.created_at).to eq('Time.new.strftime("%F %H:%M")')
  end
end