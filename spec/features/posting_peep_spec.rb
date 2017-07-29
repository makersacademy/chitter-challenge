feature 'Posting a peep to on Chitter' do
  scenario 'I can post a new peep on Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Morning everyone!')
    click_button 'Post'
    expect(page).to have_content 'Peep: Morning everyone!'
  end
end
