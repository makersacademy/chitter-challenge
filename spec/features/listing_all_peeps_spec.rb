require 'spec_helper'
require_relative 'helpers/session'
include SessionHelpers

feature "User browses the list of links" do

  before(:each) {
    Maker.create(:username => "Lorisfo",
                 :password => "Ruby!",
                 :password_confirmation => "Ruby!")
    Peep.create(:message => "This is my first chitter peep!",
                :hashtags => [Hashtag.first_or_create(:text => 'new')])
    Peep.create(:message => "This is my second chitter peep!",
                :hashtags => [Hashtag.first_or_create(:text => 'second')])
    Peep.create(:message => "This is my third chitter peep!",
                :hashtags => [Hashtag.first_or_create(:text => 'third')])
    Peep.create(:message => "This is my fourth chitter peep!",
                :hashtags => [Hashtag.first_or_create(:text => 'fourth')])
  }

  scenario "when opening the home page" do
    sign_in("Lorisfo", "Ruby!")
    expect(page).to have_content("This is my first chitter peep!")
  end

  scenario "filtered by a hashtag" do
    visit '/hashtags/new'
    expect(page).to have_content("This is my first chitter peep!")
    expect(page).not_to have_content("This is my second chitter peep!")
    expect(page).not_to have_content("This is my third chitter peep!")
    expect(page).not_to have_content("This is my fourth chitter peep!")
  end

end