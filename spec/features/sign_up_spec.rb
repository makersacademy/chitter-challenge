feature 'Sign Up' do
  scenario 'It confirms who is signed in on homepage' do
    sign_up
    expect(page).to have_content("You are signed up as Kennethy")
  end
  scenario 'It registers new peeps in the new name' do
    sign_up
    add_peep1
    expect(page).to have_content("Kennethy")
  end
end
