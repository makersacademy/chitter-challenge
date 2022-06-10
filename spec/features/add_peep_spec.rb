feature 'add a peep' do
  scenario 'adds a peep and then shows it on the homepage' do
    visit '/chitter'
    click_on 'Write'
    fill_in 'peep', with: "I never thought I'd fall in love with a utensil."
    expect(page).to have_content "I never thought I'd fall in love with a utensil."
  end
end
