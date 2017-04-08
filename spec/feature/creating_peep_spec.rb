feature 'Creating peeps' do
  scenario 'I can create a new peep' do
    visit('/peeps/new')
    fill_in 'peep', with: "Google"
    fill_in 'body', with: "https://www.google.com"
    click_button 'Add peep'
    expect(current_path).to eq '/peeps'

    # within 'ul#peeps' do
    #   expect(page).to have_content('Google')
    # end
  end
end
