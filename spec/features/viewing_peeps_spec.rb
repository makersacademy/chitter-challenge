# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature "Viewing peeps" do
  before :each do
    sign_up
    peep_1
  end

  scenario "I want to see the time a peep was made" do
    visit("/peeps")
    expect(page).to have_content "#{Peep.first.time.strftime("%R %v")}"
  end

  scenario "I want to see peeps in reverse chronological order" do
    peep_2
    visit("/peeps")
    expect(Peep.last.content).to appear_before(Peep.first.content)
  end

  scenario "I want to see who posted a peep" do
    visit("/peeps")
    expect(page).to have_content "@#{Peep.first.user.username}"
  end
end
