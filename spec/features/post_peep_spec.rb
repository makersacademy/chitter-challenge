require 'spec_helper'

feature 'post a peep' do

  scenario 'there is a post peep button' do
    visit '/peeps'
    expect(page).to have_button("Post Peep")
  end

  scenario 'post a peep' do 
    visit '/peeps/new'
    fill_in 'content', with: 'Test Peep'
    fill_in 'name', with: 'Tester'
    click_on 'Post'
    expect(page).to have_content('Test Peep')
    expect(page).to have_content('Tester')
  end 
end 
