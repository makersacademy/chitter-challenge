feature 'Visit homepage' do
  scenario 'Displays Chitter ' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end
