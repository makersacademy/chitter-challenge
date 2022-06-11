feature 'Viewing chits' do
  scenario 'A user should be able to see a chit' do
    visit('/chits')
    expect(page).to have_content "My first chit"
    expect(page).to have_content "Look ma, I'm chitting"
  end
end
