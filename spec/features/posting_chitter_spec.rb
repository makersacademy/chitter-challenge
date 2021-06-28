feature 'Posting chitter' do
  scenario 'adding text to chitter' do
    visit "/add_post"
    fill_in :text, with: "First post!"
    click_button "Submit"
    expect(page).to have_content "First post!"
  end
end
