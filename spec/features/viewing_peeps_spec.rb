
feature 'Viewing Peeps' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'A user can see a load of Peeps' do
    visit ('/feed')
    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end

end
