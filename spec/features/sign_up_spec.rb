require 'spec_helper'
require './app/models/user.rb'
require 'web_helper'

RSpec.feature "Chitter" do
  scenario "User can make account and see their email on index page" do
    sign_up
    expect(page).to have_content('Welcome Agatina!')
    users = User.all
    expect(users.count).to eq 1
  end
end
