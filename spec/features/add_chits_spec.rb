feature "add a chit" do
  scenario "user adds a new chit" do
    visit '/add'
    fill_in :chit, with: "I also like chocolate"
    click_button "Submit"
    expect(page).to have_current_path('/')
    expect(page).to have_content("I also like chocolate")
  end
end
