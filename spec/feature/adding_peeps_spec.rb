feature 'Adding new peeps' do
  scenario 'I can add a new peep to the stream' do
    sign_up
    sign_in(email: 'pollocknoah@gmail.com', password: 'makers15' )
    visit '/peeps/new'
    fill_in('peep', with: 'WAKE UP!')
    click_button('PEEP')

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('WAKE UP!')
    end
  end
end
