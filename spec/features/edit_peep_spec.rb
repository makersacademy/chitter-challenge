feature "editing peeps" do
  before do
    @peep_one = Peep.create(username: "user1", content: "content1")
    @peep_two = Peep.create(username: "user2", content: "content2")
    visit '/'
  end

  scenario "user sees edit button" do
    expect(page).to have_selector(:button, "Edit_#{@peep_one.id}")
  end
end
