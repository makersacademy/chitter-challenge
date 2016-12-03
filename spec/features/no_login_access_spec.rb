require 'spec_helper'
require './app/models/user.rb'


RSpec.feature "Chitter" do
  scenario "User can use the page without logging in" do
    visit '/'
    expect(page).to have_content('Welcome, stranger')
  end
end
