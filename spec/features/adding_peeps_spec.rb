feature 'Creating peeps' do

  scenario 'I can let people know what I am doing' do
    visit '/peeps/new'
    # fill_in 'userhandle',   with: '@ldawson_'
    fill_in 'message', with: 'This better work'
    click_button 'Create Peep'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This better work')
    end
  end
end
