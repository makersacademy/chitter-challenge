require 'spec_helper'
require '././app/models/peep'
require "timecop"

RSpec.feature 'Peep', type: :feature do
  scenario "posting a peep on chitter" do
    sign_up
    sign_in(email: 'Dio@test.com', password: '123456')
    visit '/peeps/new'
    fill_in 'peep',   with: 'this is a peep'
    click_button 'Save'
    expect(current_path).to eq '/chitter'
    expect(page).to have_content('this is a peep')
  end

  scenario "can view timestamp" do
    sign_up
    sign_in(email: 'Dio@test.com', password: '123456')
    visit '/peeps/new'
    fill_in 'peep',   with: 'this is a peep'
    click_button 'Save'
    Timecop.freeze do
      within(".peep .timestamp") do
        expect(page).to have_content DateTime.now.strftime("%c")
      end
    end
  end

end
