feature 'Posting a peep:' do
  scenario 'Users can post a peep' do
    visit '/'
    fill_in('peep', with: 'This is my peep')
    fill_in('username', with: 'leonl')
    click_button('Share my Peep!')

    expect(page).to have_content 'This is my peep'
  end
end
