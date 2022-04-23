
feature 'View peeps' do  
  let(:date) do
    Time.now.strftime('%l:%M%P, %-m %b %Y')
  end

  scenario 'visiting the index page' do    
    peep = Peep.create(peep: "This is a peep")
    Peep.create(peep: "Here is a second peep")
    Peep.create(peep: "Another peep!")

    visit '/peeps'
    
    expect(page).to have_content peep.text + "\n" + date.strip
    expect(page).to have_content "Here is a second peep" + "\n" + date.strip
    expect(page).to have_content "Another peep!" + "\n" + date.strip
  end
end
