require 'web_helper'

feature 'User can create a peep' do
  scenario 'See a message (peep) on chitter' do
    sign_up
    create_peep('Hello world!')
    expect(page.status_code).to eq 200
    within 'ul#posts' do
    expect(page).to have_content('Hello world!')
    end
  end


    scenario "The peeps are in reverse chronological order" do
      sign_up
      create_peep('Hi!')
      create_peep('Hello world!')
      expect(page.status_code).to eq 200
      within 'ul#posts' do
        expect("Hi!").to appear_before('Hello world!')
    end
  end
end
