feature 'posting a new peep' do
  scenario 'user posts a peep' do
    visit('/')
    click_button('Add peep')
    fill_in('newpeep', with: "here is my new peep!")
    click_button('Submit')

    expect(page).to have_content("here is my new peep!")
  end
end
