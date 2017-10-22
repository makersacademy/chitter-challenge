feature "shows peeps with username" do
  scenario "it shows peeps on homepage with username" do
    Peep.create(message: 'Hello there', name: 'CWong')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
    expect(page).to have_content('Hello there')
    expect(page).to have_content('CWong')
    end
  end
end
