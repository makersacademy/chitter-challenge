feature 'Posting peeps' do
  scenario 'a user can post and see a peep' do
    visit ('/')
    fill_in('username', with: 'username')
    fill_in('peep', with: 'text')
    click_button('Peep')

    expect(page).to have_content 'username posted: text'
  end
end
