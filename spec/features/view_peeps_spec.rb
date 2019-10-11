
feature 'Viewing peeps' do
  scenario 'A user can see peeps in reverse chronological order' do
    Peep.create(content: "So sunny today!")
    Peep.create(content: "Watching Adventure Time.")
    Peep.create(content: "Time is an illusion.")

    visit('/peeps')

    expect(page).to have_content "So sunny today!"
    expect(page).to have_content "Watching Adventure Time."
    expect(page).to have_content "Time is an illusion."
  end
end