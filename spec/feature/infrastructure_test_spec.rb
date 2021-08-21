feature 'check inital project structure setup' do
  scenario 'check index page exists' do
    visit ('/chitter')
    expect(page).to have_content("I'm a peep!")
    expect(page).to have_content("I'm another different peep!")
  end
end