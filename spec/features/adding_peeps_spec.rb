require 'spec_helper'
require_relative  'helpers/session'

feature "User adds a new peep" do

before(:each) do
    Maker.create(:username => "Lorisfo",
                 :password => "Ruby!",
                 :password_confirmation => "Ruby!")
  end

  scenario "when browsing the homepage" do
    expect(Peep.count).to eq(0)
    sign_in('Lorisfo', 'Ruby!')
    add_peep("This is a peep", "Lorisfo")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq("This is a peep")
    expect(peep.user).to eq("Lorisfo")
  end

  scenario "with a few hashtags" do
    sign_in('Lorisfo', 'Ruby!')
    add_peep("This is a peep", "Lorisfo", ['information', 'new'])
    peep = Peep.first
    expect(peep.hashtags.map(&:text)).to include('information')
    expect(peep.hashtags.map(&:text)).to include('new')
  end

  def add_peep(message, user, hashtags = [])
    within('#new-peep') do
      fill_in 'message', :with => message
      fill_in 'user', :with => user
      fill_in 'hashtags', :with => hashtags.join(' ')
      click_button 'Add peep'
    end
  end


end