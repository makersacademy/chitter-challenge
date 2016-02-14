require 'spec_helper'

feature 'View Peeps' do

  before do
    sign_up
    visit '/peeps/new'
    fill_in "content", with: "hello, this is a test peep and it consists of a message"
    click_button "Post peep"
  end

  scenario 'a user visits the feed and can see posted peeps' do
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('hello, this is a test peep and it consists of a message')

    end

  end

  scenario 'a user can view a peep when signed out' do
  end

end
