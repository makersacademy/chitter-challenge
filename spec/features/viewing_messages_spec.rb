feature "Viewing messages" do
  scenario "viewing messages" do
    Message.create(content: "Hello people")
    Message.create(content: "Nice day")

    visit '/messages'
    # expect row number two to be the oldest message posted
    # expect row number one to be the latest message posted
    expect(page.find('li:nth-child(2)')).to have_content "Hello people"
    expect(page.find('li:nth-child(1)')).to have_content "Nice day"
  end
end