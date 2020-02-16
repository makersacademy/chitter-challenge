feature 'Post peeps' do
  scenario 'A user can post a peep' do
    visit('/peeps/new')
    fill_in("peep_text", with: "This is my peep")
    click_button("Submit")

    expect(page).to have_content("This is my peep")
  end
end

