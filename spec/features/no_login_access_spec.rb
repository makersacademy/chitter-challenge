require 'spec_helper'
require './app/models/user.rb'
require 'web_helper'

RSpec.feature "BookmarkManager" do
  scenario "User can make account and see their email on index page" do
    visit '/'
    expect(page).to have_content('Welcome, stranger')
  end
end
