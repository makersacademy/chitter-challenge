feature 'Posting peeps' do
  scenario 'I can peep' do
    visit '/peep/new'
    fill_in 'peep', with: 'Happy fourth of july'
    click_button 'Peep'

    expect(current_path).to eq '/peep'
    within 'ul#peep' do
      expect(page).to have_content('Happy fourth of july')
    end
  end

  # scenario 'Creating a peep has the time posted' do
  #   visit '/peep/new'
  #   fill_in 'peep' with: 'This is a time test'
  #   within 'ul#peep' do
  #     expect(page).to have_content
  #   end
  # end
  #
  #
  #
  # scenario 'peeps time stamp is attached' do
  #
  #   expect(page).to have_content Peep.first(user_id: @user.id).time_stamp.strftime('%b %e')
  # end
  #
  # scenario 'peeps username is attached' do
  #
  #   expect(page).to have_content @user.username
  # end
  #
  # scenario 'peeps name is attached' do
  #   
  #   expect(page).to have_content @user.name
  # end
end
