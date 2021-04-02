feature "when reading peeps" do
  scenario "they should be shown in reverse chronological order" do
    Peep.create(message: "Test message one", user_email: 'test@example.com')
    Peep.create(message: "Test message two", user_email: 'test@example.com')
    Peep.create(message: "Test message three", user_email: 'test@example.com')
    visit("/")
    page.find("#peeps div:first-child", text: "Test message three")
    page.find("#peeps div:last-child", text: "Test message one")
  end

  scenario "it should have a time stamp" do
    test_peep = Peep.create(message: "Test message one", user_email: 'test@example.com')
    visit("/")
    expect(first(".post")).to have_content(test_peep.time.strftime("%A at %H:%M"))
  end
end