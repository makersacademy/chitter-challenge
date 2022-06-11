feature 'Viewing chits' do
  scenario 'A user should be able to see a chits on /chits' do
    Chit.create(text: "My first chit")
    Chit.create(text: "Look ma, I'm chitting")

    visit('/chits')

    expect(page).to have_content "My first chit"
    expect(page).to have_content "Look ma, I'm chitting"
  end

  scenario 'Should be able to view chits in reverse chronological order' do
    Chit.create(text: "My first chit")
    Chit.create(text: "Look ma, I'm chitting")
    visit('/chits')
  end
end
