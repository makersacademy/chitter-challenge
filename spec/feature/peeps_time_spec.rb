feature "when viewing a peep" do
  scenario "it should have a time stamp" do
    test_peep = Peep.create(message: "Test message one")
    visit("/")
    expect(first(".post")).to have_content(test_peep.time.strftime("%A at %H:%M"))
  end
end