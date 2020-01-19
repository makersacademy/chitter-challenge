# frozen_string_literal: true

feature 'Creating a peep' do
  scenario 'in peep page take an input and create a new peep' do
    visit('/')
    fill_in('create_message', with: 'This is a test peep')
    click_button('Add Peep')
    expect(page).to have_content 'This is a test peep'
  end
end
