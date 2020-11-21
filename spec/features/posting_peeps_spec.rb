feature 'Posting peeps' do
  scenario 'Have a link to post a peep' do
    visit('/')

    expect(page).to have_link("Peep it!")
  end
end
