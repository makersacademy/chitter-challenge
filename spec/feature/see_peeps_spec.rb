feature 'Peep Visibility' do
  scenario 'user can post and then see a peep' do
    visit('/add_peep')
    expect(page.status_code).to eq 200
    fill_in "content", with: "an experimental test peep"
    click_button('Submit')
    expect(page).to have_content("an experimental test peep")
  end
end
