feature 'Viewing Peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!!"
  end

  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peeps.create(comment: "Steak and eggs is the breakfast of champions!")
    Peeps.create(comment: "Dwayne Johnson does it again....")
    Peeps.create(comment: "Steve Buscemi has an odd autograph")
    Peeps.create(comment: "Set them free!")

    visit('/peeps')

    expect(page).to have_content "Steak and eggs is the breakfast of champions!"
    expect(page).to have_content "Dwayne Johnson does it again...."
    expect(page).to have_content "Steve Buscemi has an odd autograph"
    expect(page).to have_content "Set them free!"
  end
end
