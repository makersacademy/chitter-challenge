feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    Peep.create(peep: "First peep")
    Peep.create(peep: "Second peep")
    Peep.create(peep: "Third peep")

    visit('/peeps')

    expect(page).to have_content ("First peep")
    expect(page).to have_content ("Second peep")
    expect(page).to have_content ("Third peep")
  end
end

# '2016-06-22 19:10:25-07'