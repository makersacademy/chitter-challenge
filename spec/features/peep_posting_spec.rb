require 'spec_helper'
require_relative '../web-helper'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "Posting peeps" do
  let!(:peep) do
    Peep.create(body: "This is my first peep. And what a peep it is")
  end
    scenario "I want to post a peep to chitter" do
    sign_up
    log_in
    visit '/peeps/new'
    fill_in 'peep' , with: "This is my first peep. And what a peep it is"
    click_button 'Peep'
    expect(page.current_path).to eq '/peeps'
    expect(page).to have_content "This is my first peep. And what a peep it is"
  end
end
