feature 'Posting peep' do
  scenario 'A user can post a peep to Chitter' do
    visit '/peeps/new'
    fill_in('message',with: 'Test')
    click_button('Submit')

    expect(page).to have_content 'Test'
  end
end
