feature "deleting peeps" do
  before do
    @peep_one = Peep.create(username: "user1", content: "content1")
    @peep_two = Peep.create(username: "user2", content: "content2")
    visit '/'
  end

  scenario 'should see delete button' do
    expect(page).to have_selector(:button, "Delete_#{@peep_one.id}")
  end

  scenario 'clicking button should remove peep from list' do
    click_button "Delete_#{@peep_one.id}"
    expect(page).to have_content "content2"
    expect(page).not_to have_content "content1"
  end
end
