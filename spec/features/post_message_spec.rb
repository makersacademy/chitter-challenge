feature "user posts message which appears on page" do
  scenario "visits page, enters details clicks submit" do
    visit('/')
    fill_in 'user', with: "Michael"
    fill_in 'peep', with: "I'm peeping"
    click_button 'Peep'
    expect(page).to have_content "I'm peeping"
    expect(page).to have_content "Cassius"
  end
end
