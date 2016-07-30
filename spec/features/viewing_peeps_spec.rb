feature 'Viewing peeps' do
  scenario 'I can view all peeps on a peeps page' do
    Peep.create(peep: 'Pogba to United?', user: 'mufc_fan')

    visit '/peeps'

    expect(page.current_path).to eq 200

    expect(page).to have_content 'Pogba to United?'
  end
end
