feature 'post a peep' do
  scenario 'features can post and see a new peep' do
    visit('')
    fill_in 'peep', with: "Here is my profound peep, look at me."
    # use a placeholder in the HTML
    click_button('Submit')
    expect(page).to have_content("You're on Chitter – Let's Peep!")
    expect(page).to have_content("Here is my profound peep, look at me.")
    expect(page).not_to have_content("Hello World")
  end
end
