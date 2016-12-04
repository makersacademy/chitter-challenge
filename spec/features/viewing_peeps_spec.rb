feature 'Viewing peeps' do
  scenario 'I can see peeps people have posted on the peeps page' do
    Peep.create(message: "This is a peep")
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content("This is a peep")
    end
  end
end
