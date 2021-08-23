feature 'posting a peep' do
  scenario 'checks a peep message appears on the feed' do
    create_user
    visit '/feed'
    fill_in('peep', with: "My very first peep!")
    click_button('Peep!')
    expect(page).to have_content("My very first peep!")
  end

  scenario 'checks that the author of a peep is the user' do
    create_user
    visit '/feed'
    fill_in('peep', with: "My very first peep!")
    click_button('Peep!')
    expect(page).to have_content("TomChitter")
  end
end