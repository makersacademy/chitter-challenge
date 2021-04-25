feature 'Posting a new peep' do
  scenario 'user can post a peep to Chitter' do
    visit 'peeps/new'
    fill_in('peep', with: 'I love my life')
    click_button('Submit')

    expect(page).to have_content 'I love my life'
  end
end
