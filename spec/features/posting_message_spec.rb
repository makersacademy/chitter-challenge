feature "Posting messages" do
  scenario "Can post message if logged in" do
    sign_up_test_account

    fill_in(:message, with: "Hi mom")
    click_button("Chitter")

    expect(page).to have_content("Hi mom")
  end
end
