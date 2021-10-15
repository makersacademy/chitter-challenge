feature "viewing posts" do
  scenario "viewing a list of posts" do
    visit('/')
    expect(page).to have_content('I went to the grocery store.')
    expect(page).to have_content('Just saw Angelina Jolie at the chippie.')
  end
end