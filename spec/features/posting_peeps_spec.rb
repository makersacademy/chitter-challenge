feature 'posting peeps' do
  scenario 'allows user to post a peep' do
    visit('/')
    fill_in('peep', with: 'This is a test peep')
    click_button('Post Peep')
    expect(page).to have_content('This is a test peep')
  end
end
