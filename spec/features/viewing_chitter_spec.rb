feature 'Viewing Chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter Away!"
  end
end

feature 'Viewing Peeps on Chitter' do
  scenario 'A user can see a list of peeps' do
    visit('/peeps')
    
    expect(page).to have_content "Still got this bloomin lurgy and high temperature."
    expect(page).to have_content "Why's he sniffing so much?"
    expect(page).to have_content "I am in the curry house"
  end
end