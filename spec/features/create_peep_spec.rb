feature 'Creating peeps' do
  scenario 'Users can peep once logged in to their Chitter account' do
    sign_up
    sign_in(email: 'marsupilami@marsu.com', password: 'qwerty')
    visit '/peeps/new'
    fill_in('title', with: 'First Peep')
    fill_in('body', with: 'Hopefully Chitter is up and running soon')
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Hopefully Chitter is up and running soon')
    end
  end
end
