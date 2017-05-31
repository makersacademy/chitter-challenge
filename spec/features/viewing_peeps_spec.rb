feature "Posting a peep to chitter" do

  scenario "establishes the page" do
    visit('/peeps')
    expect(page.status_code).to eq 200
  end

  scenario "posts a peep" do
    visit('/peeps')
    fill_in :message, with: "Can't stop peeping"
    click_button('Submit')
    expect(page).to have_content("Can't stop peeping")
  end

end
