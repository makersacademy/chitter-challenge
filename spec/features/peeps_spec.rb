feature 'peeps' do
  scenario 'displaying peeps' do
    visit '/'
    click_button 'peeps'
    expect(page).to have_content('Peeps')
  end

  scenario 'adding peeps' do
    visit '/'
    click_button 'peeps'
    click_button 'Add peep'
    fill_in 'content', with: 'I ate a sandwich.'
    click_button 'Submit'
    expect(page).to have_content('I ate a sandwich.')
  end

end
