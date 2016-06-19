feature "Viewing peeps" do
  let!(:user) { create_user }
  let!(:first) do
    Peep.create(
      text: PEEPS.first[:text],
      timestamp: Time.new(2000, 01, 01),
      user: User.first
    )
  end

  let!(:second) do
    Peep.create(
      text: PEEPS.last[:text],
      timestamp: Time.new(2002, 01, 01),
      user: User.first
    )
  end

  scenario "peeps can be viewed in reverse chronological order" do
    visit("/peeps")

    within ".timeline" do
      expect(find("li:first-child").text).to have_content(second.text)
      expect(find("li:last-child").text).to have_content(first.text)
    end
  end
end
