feature "Viewing messages" do
  scenario "viewing messages" do
    Message.create(content: "Hello people")
    Message.create(content: "Nice day")

    visit '/messages'

    expect(page).to have_content "Hello people"
    expect(page).to have_content "Nice day"
  end
end