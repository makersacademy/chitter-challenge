feature 'Seeing the list of cheets' do
  scenario 'A user visiting the cheets main page sees a list of cheets' do
    visit '/cheets'
    expect(page).to have_text "First cheet!"
  end
end
