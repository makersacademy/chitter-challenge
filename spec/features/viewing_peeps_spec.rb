# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature "Viewing peeps" do
  before :each do
    Peep.create(content: "Peep 1", time: Time.new)
    Peep.create(content: "Peep 2", time: Time.new + 1)
  end

  scenario "I want to see the time a peep was made" do
    visit("/peeps")
    expect(page).to have_content "#{Peep.first.time.strftime("%R %v")}"
  end
end
