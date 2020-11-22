feature 'Adding a new peep' do
  scenario 'A user can post a new peep to Chitter' do
    visit('/peeps/new')
    fill_in('script', with: 'I love Sundays!')
    click_button('Submit')

    expect(page).to have_content 'I love Sundays!'
  end
end
