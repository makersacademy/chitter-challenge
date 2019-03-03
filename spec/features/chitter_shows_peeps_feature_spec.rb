feature 'Page has peeps' do
  scenario 'Shows a welcome peep' do
    visit('/')
    expect(page).to have_content("Hello and welcome to Chitter, made by Jules")
  end
end
