require_relative 'web_helper'

feature 'can post a message (peep) to Chitter' do
  scenario 'a user can post a peep' do
    sign_up
    click_button 'Post Peep'
    fill_in('peep', with: 'Test Peep')
    click_button 'Post'

    expect(page).to have_content 'Test Peep'
  end

  scenario 'a user can post multiple peeps' do
    sign_up
    click_button 'Post Peep'
    fill_in('peep', with: 'Test Peep')
    click_button 'Post'
    visit '/'
    click_button 'Post Peep'
    fill_in('peep', with: 'Test Peep 2')
    click_button 'Post'

    expect(page).to have_content 'Test Peep'
    expect(page).to have_content 'Test Peep 2'
  end

  scenario 'a user must be signed in to post peeps' do
    visit '/'

    expect(page).not_to have_button 'Post Peep'

    sign_up

    expect(page).to have_button 'Post Peep'
  end
end
