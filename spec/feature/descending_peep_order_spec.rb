feature 'show all peeps in reverse chronological order' do
  scenario 'user wants to see the newest peeps first' do
    visit('/chitter')
    find_button('Newest Peeps').click
    click_button('Newest Peeps')
    expect(page).to have_content("Im another different peep!")
    expect(page).to have_content("Im a peep!")
  end
end