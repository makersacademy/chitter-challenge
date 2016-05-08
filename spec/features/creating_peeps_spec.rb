feature 'Creating Peeps' do

  scenario '- logged in user can create a peep that gets displayed in the feed' do
    sign_up
    sign_in
    fill_in('content', with: 'This is a test peep')
    click_button('Post')
    expect(Peep.all.count).to eq 1
    within('ul.feed') do
      expect(page).to have_content('This is a test peep')
    end
  end

  scenario '- user not logged in cannot create a peep' do
    visit('/peeps/index')
    expect(page).not_to have_button('Post')
  end

end