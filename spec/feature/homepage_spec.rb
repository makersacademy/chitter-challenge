# frozen_string_literal: true

feature '/index' do
  scenario 'Greeting page' do
    visit('/chitter')
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario 'Clicking button should take user to correct post page' do
    visit '/chitter'
    click_button 'Write peep'
    expect(page).to have_content 'Write a peep'
  end
end
