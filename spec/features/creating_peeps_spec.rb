feature 'Creating peeps' do
  scenario 'Creates and displays a peep' do
    visit '/'
    click_button 'Add'
    fill_in 'peep_text', with: 'Peep 1'
    click_button 'Post'
    expect(page).to have_content 'Peep 1'
  end
end
