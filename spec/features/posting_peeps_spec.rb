feature 'Posting a peep' do
  scenario 'I can post a peep to my_peeps' do
    visit('/peep/new')
    fill_in('peep', with: 'test peep')
    click_button('Submit')
    expect(page).to have_content 'test peep'
  end
end
