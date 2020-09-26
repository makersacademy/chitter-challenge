feature 'Post a peep' do
  scenario 'Posting a peep with <= 30 chars is allowed' do
    visit '/'
    fill_in 'peep_message', with: 'This is a test peep'
    click_button 'Post'
    expect(page).to have_content('This is a test peep')
  end

  scenario 'Posting a peep with > 30 chars is prohibited' do
    visit '/'
    fill_in 'peep_message', with: 'This message will be cropped at 30 chars'
    expect(page).to have_field('peep_message', with: 'This message will be cropped a')
  end
end
