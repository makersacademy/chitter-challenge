feature 'Posting a peep' do
  scenario "expect to be able to write and submit a message" do
    visit("/create")
    fill_in('peep', with: 'Hello!')
    click_button("Submit")
    expect(page).to have_content('Hello!')
  end
end
