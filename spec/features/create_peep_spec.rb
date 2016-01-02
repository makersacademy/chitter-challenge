feature 'creating peeps' do
  scenario 'so user can create a new peep' do
    visit('/peeps/new')
    fill_in(:content, with: 'My first ever peep!')
    click_button('Post Peep')
    expect(page).to have_content('My first ever peep!')
  end
end
