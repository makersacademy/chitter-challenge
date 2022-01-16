
feature 'View peeps' do
  scenario 'visiting the index page' do    
    Peep.create(peep: "This is a peep")
    Peep.create(peep: "Here is a second peep")
    Peep.create(peep: "Another peep!")

    visit '/peeps'
    
    expect(page).to have_content "This is a peep"
    expect(page).to have_content "Here is a second peep"
    expect(page).to have_content "Another peep!"
  end
end
