feature "Testing infrastructure:" do
  scenario "I can visit the homepage" do
    visit "/"
    expect(page).to have_content "Submit your peep to chitter"
  end
end
