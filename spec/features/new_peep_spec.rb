require 'spec_helper'
require '././app/models/peep'

RSpec.feature 'Peep', type: :feature do
  scenario "posting a peep on chitter" do
    visit '/peeps/new'
    fill_in 'peep',   with: 'this is a peep'
    click_button 'Save'
    expect(current_path).to eq '/chitter'
    within 'ul#chitter' do
      expect(page).to have_content('this is a peep')
    end
  end
end
