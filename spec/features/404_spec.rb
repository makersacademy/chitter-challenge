feature 'the user sees the 404 page' do
  scenario 'when they go down the wrong route' do
    visit '/404'
    expect(page).to have_content("Sorry, you've taken a wrong turn.")
  end
end
