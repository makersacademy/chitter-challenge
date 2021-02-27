feature 'Viewing Peeps' do
  scenario 'Posting a Peep' do
    visit('/')
    fill_in :peep, with: 'Watching TV'
    click_button('Peep')
    expect(page).to have_content 'Watching TV'
  end
end
