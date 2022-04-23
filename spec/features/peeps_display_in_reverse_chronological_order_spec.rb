
feature 'Ordered peeps' do
  let(:date) do
    formatted_time
  end

  scenario 'users see peeps displayed in reverse chronological order' do    
    Peep.create(peep: "This is a peep")
    Peep.create(peep: "Here is a second peep")
    Peep.create(peep: "Another peep!")
    
    visit '/peeps'

    peeps = page.find_all('.peep')
    
    expect(peeps[0].text).to eq "Another peep!\n" + date.strip
    expect(peeps[1].text).to eq "Here is a second peep\n" + date.strip
    expect(peeps[2].text).to eq "This is a peep\n" + date.strip
  end
end
