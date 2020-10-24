require 'pg'

feature 'viewing /peeps' do
  scenario 'it displays peep text' do
    Peep.create(peep_text: "My first peep", time: 'NOW()')
    Peep.create(peep_text: "My second peep", time: 'NOW()')
    visit('/peeps')
    expect(page).to have_content("My first peep")
    expect(page).to have_content("My second peep")
  end
end

feature 'Adding a new peep' do
  scenario 'A user can post a peep' do
    timenow = Time.now.to_s
    visit('/peeps/new')
    fill_in('peep_text', with: "This is a peep")
    fill_in('time', with: 'NOW()')
    click_button('Submit')
    expect(page).to have_content("This is a peep")
    expect(page).to have_content(timenow[0...16])
  end
end

feature 'User can sign up' do
  scenario 'A user can enter details' do
    User.create(username: "my username1", name: "name2", email: "email@email.com3", password: "my password4")
    visit('/peeps/new')
    expect(page).to have_content("Enter details to sign up")
    expect(page).to have_content("Enter Peep text (Character limit: 100)")
  end
end

feature 'User can sign up' do
  scenario 'A user can enter details' do
    User.create(username: "my username1", name: "name2", email: "email@email.com3", password: "my password4")
    visit('/peeps')
    expect(page).to have_content("Peeps")
    expect(page).to have_content("Time posted")
  end
end

feature 'Entering users details' do
  scenario 'A user signs up' do
    visit('/peeps/new')
    fill_in('email', with: "email@email.com")
    fill_in('password', with: "my password")
    fill_in('name', with: "my name")
    fill_in('username', with: "my username")
    click_button('Signup')
    expect(page).to have_content("my username")
    expect(page).to have_content("my name")
  end
end
