require 'spec_helper'

feature "User browses the list of links" do

  before(:each) {
    Peep.create(:message => "This is my first chitter peep!",
                :user => "Lorisfo",
                :hashtags => [Hashtag.first_or_create(:text => 'new')])
    Peep.create(:message => "This is my second chitter peep!",
                :user => "Lorisfo",
                :hashtags => [Hashtag.first_or_create(:text => 'second')])
    Peep.create(:message => "This is my third chitter peep!",
                :user => "Lorisfo",
                :hashtags => [Hashtag.first_or_create(:text => 'third')])
    Peep.create(:message => "This is my fourth chitter peep!",
                :user => "Lorisfo",
                :hashtags => [Hashtag.first_or_create(:text => 'fourth')])
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Lorisfo")
  end

  scenario "filtered by a hashtag" do
    visit '/hashtags/new'
    expect(page).to have_content("This is my first chitter peep!")
    expect(page).not_to have_content("This is my second chitter peep!")
    expect(page).not_to have_content("This is my third chitter peep!")
    expect(page).not_to have_content("This is my fourth chitter peep!")
  end

end