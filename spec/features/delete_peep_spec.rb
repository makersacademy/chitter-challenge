feature "deleting peeps" do
  before do
    @peep_one = Peep.create(username: "user1", content: "content1")
    @peep_two = Peep.create(username: "user2", content: "content2")
    visit '/'
  end

  scenario 'should see delete button' do
    save_and_open_page
    expect(page).to have_selector(:button, "Delete_#{@peep_one.id}")
  end
end
