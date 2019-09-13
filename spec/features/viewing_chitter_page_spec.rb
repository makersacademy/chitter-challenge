feature 'Viewing chitter ' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'viewing other users peeps' do
  scenario 'see all peeps in reverse chitter_test' do

    Peeps.add(message: "Tired")
    Peeps.add(message: "Hungry")
    Peeps.add(message: "lonely")
    
    visit ('/')

    expect(page).to have_content "Tired"
    expect(page).to have_content "Hungry"
    expect(page).to have_content "lonely"
  end
end
