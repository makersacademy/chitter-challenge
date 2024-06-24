feature 'Post a new peep' do
  scenario 'a user can post a new peep' do
    visit '/peeps'
    fill_in 'peep', with: "My first peep!"
    fill_in 'user', with: "Leah"
    click_button 'Post'

    expect(page).to have_content("My first peep!")
  end
end
