feature 'posting a peep' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'see all peeps' do
    visit ('/peeps')

    expect(page).to have_content("Congratulations to the Astronauts that left Earth today. Good choice")
    expect(page).to have_content("Me, in hell: I was told there would be a “special” place for me?")
  end
end
