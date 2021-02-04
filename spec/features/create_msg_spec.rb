feature "creating a message" do
  scenario "users enters text and submits message" do

    visit('/peeps')
    fill_in('peep', with: 'Feature Test 1')
    click_button('Submit')

    visit('/display')
    expect(page).to have_content('Feature Test 1')
  end
end
