feature 'Posting a new Peep' do
  scenario 'A user can a peep to Chitter' do
    visit('/')
    fill_in('message', with: "Yo, Tom from MySpace here")
    click_button('Peep')
    expect(page).to have_content("Yo, Tom from MySpace here")
  end
end