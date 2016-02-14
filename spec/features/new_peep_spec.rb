require 'spec_helper'

feature 'New peep' do
  scenario 'creates a new peep' do
    sign_up

    click_link 'New peep'
    fill_in 'content', with: 'My first peep!'

    expect { click_button 'Submit' }.to change(Peep, :count).by 1
    expect(current_path).to eq '/peeps/all'
    expect(page).to have_content 'My first peep!'
  end
end
