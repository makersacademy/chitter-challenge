require 'timecop'

feature 'Viewing peeps' do
  scenario 'A user can see peeps in reverse chronological order' do
    sign_up
    Peep.create(content: "So sunny today!")
    Peep.create(content: "Watching Adventure Time.")

    visit('/peeps')
    peeps = page.all('.peep')
    expect(peeps[0]).to have_content "Watching Adventure Time."
    expect(peeps[1]).to have_content "So sunny today!"
  end

  scenario 'A user can see the time when the peep was posted' do
    sign_up
    t = Time.utc(2019, 10, 12, 10, 15, 10)
      Timecop.freeze(t)
    Peep.create(content: "Chirp-chirp!")

    visit('/peeps')
    expect(page).to have_content "12 Oct 2019 at 10:15 AM"
    Timecop.return
  end
end