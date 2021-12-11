feature "Posting messages" do
  scenario "posted messsage shows on page" do
    visit("/")
    fill_in(:message, with: "Hi mom")
    click_button("Chitter")

    expect(page).to have_content("Hi mom")
  end
end