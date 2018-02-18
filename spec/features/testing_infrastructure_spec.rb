feature "test infrastructure" do
  scenario "infra working" do
    visit ('/')
    expect(page).to have_content("CHITTER")
  end
end
