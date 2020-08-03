require 'spec_helper'

feature 'view peeps' do
  scenario "user can view list of previous peeps" do
    visit '/peep'
    expect(page).to have_selector text: 'Add a peep'
  end
end