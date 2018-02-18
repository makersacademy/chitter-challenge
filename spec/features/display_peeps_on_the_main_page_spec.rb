feature "Chitter displays peeps on the main page" do
  scenario "peeps are displayed" do
    visit ("/")
    expect(page).to have_content ("Nice day for coding")
  end
end
