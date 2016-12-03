require 'spec_helper'

RSpec.feature 'New peep' do

  scenario "- peeps can be created" do
    expect{ sign_up_and_peep('Lorem ipsum dolor sit amet.') }.to change(Peep, :count).by(1)
  end

  scenario "- fails if content is empty" do
    expect{ sign_up_and_peep(nil) }.not_to change(Peep, :count)
  end

  scenario "- redirects if noone is logged in" do
    visit '/peeps/new'
    expect(page).to have_current_path('/sessions/new')
  end

  scenario "- user can see just created peep" do
    sign_up_and_peep('Lorem ipsum dolor sit amet.')
    expect(page).to have_content('Lorem ipsum dolor sit amet.')
  end

end
