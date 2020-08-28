feature 'Creating and posting a peep' do
  scenario 'User writes peeps and posts it to chitter' do
    visit '/'
    click_button 'New Peep'
    fill_in 'peep', with: 'Creating first peep!'
    click_button 'Post'
    expect(page).to have_content('Creating first peep!')
  end
end
