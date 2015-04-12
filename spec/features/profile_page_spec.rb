require 'spec_helper'
require_relative 'helpers/session'
require_relative 'helpers/peep_helper'

include SessionHelpers
include PeepHelpers

feature 'when a user is visiting the site' do
  before do
    User.create(username: "bob89",
                name: "Bob",
                email: "bob@email.com",
                password: "password",
                password_confirmation: "password")
    log_in("bob89", "password")
    peep("this is a peep")
    comment("and this is a comment")
    click_link "Log out"
  end

  scenario 'he can go on the profile page of any user' do
    visit '/user/bob89'
    expect(page).to have_content "this is a peep"
  end

  scenario 'he got error page when visits a profile that doesn\'t exist' do
    visit '/user/john89'
    expect(page).to have_content "Error"
  end

end