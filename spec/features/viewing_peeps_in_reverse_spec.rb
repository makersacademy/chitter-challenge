feature 'Peeps are shown in reverse chronological order' do
  scenario 'User writes 3 peeps and posts them to chitter' do
    visit '/create_peep'
    fill_in 'peep', with: 'First peep created !'
    click_button 'Post'
    click_button 'New Peep'
    fill_in 'peep', with: 'Second peep created !'
    click_button 'Post'
    click_button 'New Peep'
    fill_in 'peep', with: 'Third peep created !'
    click_button 'Post'
    expect(page).to have_content('Third peep created ! Second peep created ! First peep created !')
  end
end
