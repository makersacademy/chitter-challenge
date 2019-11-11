feature 'adding a peep' do
  scenario 'adds a peep' do
    visit '/chitter'
    fill_in('peep', with: 'test peep')
    click_button 'Post Peep'
    expect(page).to have_content 'test peep'
  end
end
