feature "/" do
  scenario "accesses home page and finds \"hello\"" do
    visit '/'
    expect(page).to have_content("Chitter")
  end
end
