feature 'Show all peeps' do
  scenario 'I can see all peeps' do
    post(peep: "my new peep")
    post(peep: "my other peep")
    post(peep: "even another peep")

    expect(page).to have_content("my new peep")
    expect(page).to have_content("my other peep")
    expect(page).to have_content("even another peep")
  end
end
