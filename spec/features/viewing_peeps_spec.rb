feature 'Viewing Peeps is the homepage' do

  scenario 'when you visit the homepage you can see the peeps' do
    visit('/')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Peeps')
  end
end
