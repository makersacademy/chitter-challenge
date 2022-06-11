feature 'add a peep' do
  scenario 'adds a peep and then shows it on the homepage' do
    visit '/chitter'
    click_on 'Compose a peep'
    fill_in 'peep', with: "I never thought I would fall in love with a utensil."
    click_on 'Share'
    expect(page).to have_content "I never thought I would fall in love with a utensil."
  end
end
