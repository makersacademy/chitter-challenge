feature 'can post a message (peep) to Chitter' do
  scenario 'a user can post a peep' do
    visit '/'
    click_button 'Post Peep'
    fill_in('peep', with: 'Test Peep')
    click_button 'Post'

    expect(page).to have_content 'Test Peep'
  end

  scenario 'a user can post multiple peeps' do
    visit '/'
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
end
