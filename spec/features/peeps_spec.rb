feature "visit /peeps page" do
  scenario "viewing peeps" do

    Peep.create(message: "Howdy!")
    Peep.create(message: "Anyone there?")
    Peep.create(message: "Party time!")

    visit '/peeps'

    expect(page.find('li:nth-child(1)')).to have_content("Party time!")
    expect(page.find('li:nth-child(2)')).to have_content("Anyone there?")
    expect(page.find('li:nth-child(3)')).to have_content("Howdy!")
  end
end