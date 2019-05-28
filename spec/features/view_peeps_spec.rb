feature 'View peeps' do
  scenario 'displays all peeps' do
    Peep.create(peep: "Hello Europe")
    peep_two = Peep.create(peep: "Bye!")

    visit('/')
    
    expect(first('.box')).to have_content("Bye!")
    expect(first('.box')).to have_content(peep_two.timestamp)
    expect(page).to have_content("Hello Europe")
  end
end
