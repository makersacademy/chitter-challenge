# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature "Viewing peeps" do
  before :each do
    Peep.create(content: "Peep 1", time: Time.now)
    Peep.create(content: "Peep 2", time: Time.now + 1)
  end

  scenario "I want to see the time a peep was made" do
    visit("/peeps")
    expect(page).to have_content "#{Peep.first.time.strftime("%R %v")}"
  end

  scenario "I want to see peeps in reverse chronological order" do
    visit("/peeps")
    expect(Peep.last.content).to appear_before(Peep.first.content)
  end
end
