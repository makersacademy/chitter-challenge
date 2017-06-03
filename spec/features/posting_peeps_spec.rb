feature 'Posting peeps' do
  scenario 'users can post a peep to Chitter' do
    visit '/peeps/new'
    fill_in('Name', with: 'Charlottay')
    fill_in('Chitter Username', with: '@codey_mc_code_face')
    fill_in('Peep Message', with: 'OMG! Makers weekend challenges r so cool?!!')
    click_button('Add')
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('OMG! Makers weekend challenges r so cool?!!')
    end
  end
end
