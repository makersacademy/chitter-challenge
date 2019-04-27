
feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    Peep.create(text: "Peep1")
    Peep.create(text: "Peep2")

    visit '/peeps'

    expect(page).to have_content "Peep1"
    expect(page).to have_content "Peep2"
  end

  scenario 'A user can see the time that the peep was posted' do
    allow(Time).to receive(:now).and_return(Time.parse("2019-04-27 11:14:20 +0100"))
    Peep.create(text: "Peep3")
    visit '/peeps'
    expect(page).to have_content('Peep3 11:14, 27 April')
  end

  scenario 'A user can see the peeps in reverse chronological order' do
    allow(Time).to receive(:now).and_return(Time.parse("2019-04-27 11:14:20 +0100"))
    Peep.create(text: "First peep")
    sleep(0.2)
    Peep.create(text: "Second peep")
    visit '/peeps'
    expect(page).to have_content("Second peep 11:14, 27 April\nFirst peep 11:14, 27 April")
  end
end
