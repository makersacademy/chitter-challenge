feature 'viewing homepage' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end
