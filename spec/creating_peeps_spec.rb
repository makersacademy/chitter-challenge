feature 'Writing peeps' do

  scenario 'I can write a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'test new message'
    fill_in 'user', with: 'Lukasz'
    click_button 'Peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('test new message')
    end
  end
end