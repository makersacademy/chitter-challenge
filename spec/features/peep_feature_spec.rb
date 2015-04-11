require 'spec_helper'
require_relative 'helpers/session'
require_relative 'helpers/peep_helper'

include SessionHelpers
include PeepHelpers

feature 'Not being logged' do
  before do
    User.create(username: "bob89",
                name: "Bob",
                email: "bob@email.com",
                password: "password",
                password_confirmation: "password")
    log_in("bob89", "password")
    peep("this is a peep")
    comment("and this is a comment")
    click_button "Log out"
  end

  scenario 'nobody can peep' do
    expect(page).not_to have_button 'Peep'
  end

  scenario 'nobody can comment' do
    expect(page).not_to have_button 'Insert comment'
  end

  scenario 'everybody can view peeps' do
    expect(page).to have_content "this is a peep"
  end

  scenario 'everybody can view comments' do
    expect(page).to have_content "and this is a comment"
  end

end

feature 'After log in' do
  before do
    User.create(username: "bob89",
                name: "Bob",
                email: "bob@email.com",
                password: "password",
                password_confirmation: "password")
    log_in("bob89", "password")
  end

  scenario 'user can peep something' do
    peep("this is a peep")
    expect(page).to have_content "this is a peep"
  end

  scenario 'user can comment a peep' do
    peep("this is the peep")
    comment("and this is the comment")
    expect(page).to have_content "and this is the comment"
  end

end

