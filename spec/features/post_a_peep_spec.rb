feature 'Post peeps' do
  scenario 'A user can post a peep and it will be assigned a time' do
    visit('/peeps/new')
    fill_in("content", with: "This is my peep")
    click_button("Submit")

    expect(page).to have_content("This is my peep")
    expect(page).to have_text(/\d{2}:\d{2}:\d{2}/)
  end
end
