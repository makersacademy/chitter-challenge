feature 'Post a peep' do
  scenario 'Peep form is not displayed if not logged in' do
    visit '/'
    expect(page).not_to have_field("peep_message")
  end

  scenario 'Posting a peep with <= 30 chars is allowed' do
    register_user
    fill_in 'peep_message', with: 'This is a test peep'
    click_button 'Post'
    expect(page).to have_content('This is a test peep')
    log_out
  end

  scenario 'Posting a peep with > 30 chars is prohibited' do
    register_user
    fill_in 'peep_message', with: 'This message will be cropped at 30 chars'
    expect(page).to have_field('peep_message', with: 'This message will be cropped a')
    log_out
  end
end
