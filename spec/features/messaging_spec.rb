feature "Messages" do
  
  scenario "User can send a message and see it displayed" do
    sign_up
    sign_in
    fill_in :body, with: "This is a test message"
    click_button "Send"
    expect(page.status_code).to eq 200
    expect(page).to have_content "This is a test message"
  end
end