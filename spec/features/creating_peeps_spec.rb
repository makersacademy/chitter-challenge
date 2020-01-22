feature 'Adding a new peep' do
  scenario 'I want to post a message (peep) to chitter' do
    visit('/chitter/new')
    fill_in('peep', with: 'Test peep')
    click_button('Submit')

    expect(page).to have_content 'Test peep'
  end
end
