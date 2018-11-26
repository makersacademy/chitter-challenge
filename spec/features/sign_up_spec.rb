feature "you are able to add your details" do
  scenario "it saves your details" do
    log_in
    visit "/"
    expect(page).to have_content "Welcome John Doe"
  end
end
