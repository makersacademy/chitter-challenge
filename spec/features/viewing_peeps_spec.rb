feature 'Viewing peeps' do
  scenario 'User can see all peeps in reverse chronological order' do
    add_peep("Oldest peep")
    add_peep("Extra peep")
    add_peep("Most recent peep")

    visit '/peeps'

    expect(find("ul li:first-child")).to have_content "Most recent peep"
    expect(find("ul li:last-child")).to have_content "Oldest peep"
  end
end
