feature 'Displaying peeps' do
  scenario 'can see existing peeps on the peeps page' do
    Peep.create(peep_text: "Hi, this is a new peep!")
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content("Hi, this is a new peep!")
    end
  end
end
