feature 'check inital project structure setup' do
  scenario 'check index page exists' do
    visit('/chitter')
    expect(page).to have_content("Im a peep!")
    expect(page).to have_content("Im another different peep!")
    find_button('New Peep').click
  end
end
