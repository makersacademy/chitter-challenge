feature 'Posting a new Peep' do
  scenario 'A user can a peep to Chitter' do
    visit('/')
    fill_in('messsage', with: "Yo, it's me, Tom from MySpace")
    click_button('Peep')
    expect(page).to have_content("Yo, it's me, Tom from MySpace")
  end
end