# frozen_string_literal: true

feature '/index' do
  scenario 'Clicking button should take user to correct post page' do
    visit '/chitter'
    click_button 'Write peep'
    expect(page).to have_content 'Write a peep'
  end
end
