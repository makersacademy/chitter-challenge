feature 'Home page' do
  scenario 'A logged in user can publish a peep' do
    create_account
    expect(User.count).to eq 1
    publish_peep
    expect(page).to have_content("My first peep!")
  end
end

feature 'Home page' do
  scenario 'Users can view previous peeps' do
    create_account
    publish_peep
    publish_peep_1
    publish_peep_2
    expect(page).to have_content("Recent peeps")
    expect(page).to have_content("My first peep!")
    expect(page).to have_content("My second peep!")
    expect(page).to have_content("My third peep!")
  end
end
