require "pg"

feature "When viewing peeps" do
  scenario "they should be shown in reverse chronological order" do
    Peep.create(message: "Test message one")
    Peep.create(message: "Test message two")
    Peep.create(message: "Test message three")
    Peep.create(message: "Test message four")
    Peep.create(message: "Test message five")
    visit("/")
    page.find("#peeps div:first-child", text: "Test message five")
    page.find("#peeps div:last-child", text: "Test message one")
  end
end