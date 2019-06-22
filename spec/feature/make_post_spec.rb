feature '## Posting a peep to Chitter' do
  scenario 'User posts a peep' do
    visit '/timeline'
    fill_in 'Peep?', with: 'My first Peep!'
    click_link 'post'
    expect(page).to have_content('My first Peep!')
  end
end