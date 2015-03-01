require 'spec_helper'
require_relative './helpers/sign_up.rb'
require_relative './helpers/add_peep.rb'

feature "User adds a new peep" do

  scenario "must be logged in send a peep" do
    visit '/peeps'
    expect(page).not_to have_content "Add peep"
  end

  scenario "1 new peep can be added" do
    sign_up
    add_peep "this is a short peep"
    expect(page).to have_css('.peep', :count => 1)
  end

   scenario "with the intended peep message showing" do
    sign_up
    add_peep "this is a short peep"
    expect(page).to have_css('.peep', :text => "this is a short peep")
  end

  scenario "peeps are ordered chronologically" do
    sign_up
    add_peep "this is a short peep"
    add_peep "this is a second short peep"
    expect(page).to have_css('li:nth-child(1)', :text => "this is a short peep")
    expect(page).to have_css('li:nth-child(2)', :text => "this is a second short peep")
  end

  scenario "peep shows the 'user name' that submitted it" do
    sign_up
    add_peep "this is a short peep"
    expect(page).to have_css('.user_entry', :text => "SuperMan")
  end

  scenario "peep shows date time peep was sent" do
    sign_up
    add_peep "this is a short peep"
    expect(page).to have_css('.user_entry', :text => "Jimbo Jones")
  end



end