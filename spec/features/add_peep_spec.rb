feature 'add a peep' do
  scenario 'adds a peep and then shows it on the homepage' do
    visit '/chitter'
    click_on 'Compose a peep'
    fill_in 'peep', with: "I never thought I would fall in love with a utensil."
    click_on 'Share'
    expect(page).to have_content "I never thought I would fall in love with a utensil."
  end

  scenario 'adds a peep with an apostrophe and then shows it on the homepage' do
    visit '/chitter'
    click_on 'Compose a peep'
    fill_in 'peep', with: "What's peeping with YOU!?"
    click_on 'Share'
    expect(page).to have_content "What's peeping with YOU!?"
  end
end
