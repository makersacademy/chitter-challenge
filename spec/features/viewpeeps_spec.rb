feature 'show all peeps in descending order' do
  scenario 'User follows a person and can now see their peeps in descending order' do
    Peep.create(message: "comment")
    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps'
    expect(page).to have_content "comment"
  end
end
