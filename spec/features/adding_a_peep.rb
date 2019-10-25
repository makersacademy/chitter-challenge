require 'spec_helper'

feature 'adding a peep' do
  scenario 'post a peep' do
    visit('/chitter/new')
    fill_in('message', with: 'This is my peep')
    fill_in('username', with: 'adam_f')
    click_button('Submit')

    expect(page).to have_content('This is my peep - adam_f')
  end
end
