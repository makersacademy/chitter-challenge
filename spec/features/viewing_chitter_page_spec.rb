feature 'Viewing chitter ' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'viewing other users peeps' do
  scenario 'see all peeps in reverse chronological order' do
    visit ('/')
    expect(page).to have_content "I'm so tired"
    expect(page).to have_content "Hungry"
    expect(page).to have_content "lonely"
  end
end
