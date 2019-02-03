feature 'Date & Time' do
  scenario "expect to see what date and time peep posted" do
    visit("/create")
    fill_in('peep', with: 'Hello!')
    click_button("Submit")
    expect(page).to have_content('Hello!')
    expect(page).to have_content('Posted at:')
  end
end
