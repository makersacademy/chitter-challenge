feature 'Can see all peeps' do
  scenario 'can see all peeps even when logged out' do
    Peep.create(message: "Peep 1", username: "example12", user: "Example",
     time: Time.now)
    Peep.create(message: "Peep 2", username: "darth_vadar", user: "Anakin",
      time: Time.now)
    visit('/')
    expect(page).to have_content("Peep 1")
    expect(page).to have_content("Peep 2")
  end

  scenario 'can see peeps in reverse order - most recent first' do
    Peep.create(message: "Peep 1", username: "example12", user: "Example",
      time: Time.now)
    time = Time.now
    Peep.create(message: "Peep 2", username: "darth_vadar", user: "Anakin",
      time: time)
    visit('/')
    expect(page).to have_content("Peep 2 #{time.asctime} Example")
  end

  scenario 'can see the time the peep was made' do
    time = Time.now
    Peep.create(message: "Peep 1", username: "example12", user: "Example",
      time: time.asctime)
    visit('/')
    expect(page).to have_content(time.asctime)
  end
end