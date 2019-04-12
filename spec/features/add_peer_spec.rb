feature "Add peers" do
  scenario "You can add a new peer and list it" do
    visit("/peers/add")
    fill_in :content, with: "Testing the add peers feature"
    # fill_in :user, with: "BBC"
    click_button "Chit"
    expect(page).to have_content "Testing the add peers feature"
  end

  # scenario 'The bookmark must be a valid URL' do
  #   visit('/bookmarks/add')
  #   fill_in :bookmark_title, with: 'not a real bookmark'
  #   fill_in :bookmark_url, with: 'not a real bookmark'
  #   click_button('Add')
  #
  #   expect(page).not_to have_content "not a real bookmark"
  #   expect(page).to have_content "You must submit a valid URL."
  # end
end
