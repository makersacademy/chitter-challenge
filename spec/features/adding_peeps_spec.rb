feature 'Adding peeps' do
  scenario 'A user can add a peep' do
    visit('/peeps/new')
    fill_in('peep', with: "Just been to the park, the weather is awesome")
    click_button('Post')

    expect(page).to have_content "Just been to the park, the weather is awesome"
  end
end
