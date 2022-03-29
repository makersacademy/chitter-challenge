
feature 'Ordered peeps' do
  scenario 'users see peeps displayed in reverse chronological order' do    
    Peep.create(peep: "This is a peep")
    Peep.create(peep: "Here is a second peep")
    Peep.create(peep: "Another peep!")
    
    peeps = page.find_all('.peep')

    visit '/peeps'
    
    expect(peeps[0].text).to eq "Another peep!"
    expect(peeps[1].text).to eq "Here is a second peep"
    expect(peeps[2].text).to eq "This is a peep"
  end
end
