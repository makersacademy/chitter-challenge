feature 'viewing and posting peeps' do

  scenario 'it shows page contents' do
    visit('/')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Chitter')
    expect(page).to have_field('content')
    expect(page).to have_button('Peep')
  end
  
  scenario 'it posts a peep' do
  	visit('/')
  	fill_in :content, with: 'Hello, this is my first peep on Chitter!'
  	click_button 'Peep'
  end

end
