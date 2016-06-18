feature "Viewing peeps" do
  scenario "peeps can be viewed in reverse chronological order" do
    create_users
    Peep.create(text: "First Y2k", timestamp: Time.new(2000, 01, 01) , user: User.first)
    Peep.create(text: "Third", timestamp: Time.new(2002, 01, 01) , user: User.first)
    Peep.create(text: "Second", timestamp: Time.new(2001, 01, 01) , user: User.first)
    visit("/peeps")

    within "#timeline" do
      expect(find("li:first-child").text).to have_content("Third")
      expect(find("li:nth-child(2)").text).to have_content("Second")
      expect(find("li:last-child").text).to have_content("First Y2k")
    end
  end
end
