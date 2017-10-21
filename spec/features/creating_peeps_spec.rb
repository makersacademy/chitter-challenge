feature 'Creating peeps' do
  scenario 'I want to create a peep using the datamapper syntax' do
    Peep.create(contents: "Peep123")
    visit '/feed'
    expect(page).to have_content 'Peep123'
  end
end
