feature "shows peeps with username" do
  scenario "it shows peeps on homepage with username" do
    Peep.create(message: 'Hello there', name: 'CWong')
    visit '/'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
    expect(page).to have_content('Hello there')
    end
  end
end
