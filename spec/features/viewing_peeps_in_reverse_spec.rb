feature 'Peeps are shown in reverse chronological order' do
  scenario 'User writes 3 peeps and posts them to chitter' do
    visit '/'
    click_button 'New Peep'
    fill_in 'peep', with: 'First peep created !'
    click_button 'Post'
    click_button 'New Peep'
    fill_in 'peep', with: 'Second peep created !'
    click_button 'Post'
    click_button 'New Peep'
    fill_in 'peep', with: 'Third peep created !'
    click_button 'Post'
    expect(page.find('li:nth-child(1)')).to have_content 'Third peep created !'
    expect(page.find('li:nth-child(2)')).to have_content 'Second peep created !'
    expect(page.find('li:nth-child(3)')).to have_content 'First peep created !'
  end
end
