feature "testing infrastructure" do
  scenario "Can visit page and see text" do
    visit ('/peeps')
    expect(page).to have_content "I just ate an apple"
    expect(page).to have_content "Chitter is the best"
    expect(page).to have_content "Howdy"  end
end
