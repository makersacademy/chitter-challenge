feature 'post peep' do
  scenario 'post a peep and have it appear in the list' do
    visit('/')
    click_on('Write a Peep!')
    fill_in('peep_content', with: 'test peep')
    click_on('Post Peep')
    expect(page).to have_content('test peep')
  end
end
