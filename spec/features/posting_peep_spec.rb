feature 'Posting a peep on Chitter' do
  scenario 'I can post a new peep on Chitter' do
    sign_up
    visit('/peeps/new')
    fill_in('message', with: 'Morning everyone!')
    click_button 'Post'
    expect(page).to have_content 'Peep: Morning everyone!'
  end
end
