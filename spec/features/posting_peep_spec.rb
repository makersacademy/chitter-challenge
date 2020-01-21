feature 'Posting a peep' do
  scenario 'A user can post a peep' do
    visit('/peeps')
    fill_in('body', with: 'Hello chitter')
    click_button('Peep')
    expect(page).to have_content('Hello chitter')
  end
end
