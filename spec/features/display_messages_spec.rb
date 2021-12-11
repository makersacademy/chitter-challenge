feature "display messages" do
  scenario "messages show in reverse chronological order" do
    visit("/")
    fill_in(:message, with: "Hi mom")
    click_button("Chitter")
    fill_in(:message, with: "Hi mom again!")
    click_button("Chitter")
    
    expect(page).to have_content("Hi mom again! Hi mom")
  end

  scenario  "timestamp displayed for message" do
    
    
  end
end