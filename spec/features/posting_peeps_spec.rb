feature '#Posting peeps' do
  scenario 'Users can post peeps with usernames and content displayed' do
    user = create(:user)
    sign_in_as(user)
    visit('/peeps/new')
    expect(page).to have_content('Insert your peep here:')
    fill_in('peep', with: 'Hey!')
    click_button('Submit')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Hey!')
    expect(page).to have_content("#{user.username}")
  end

  scenario 'Users cannot post peeps when not logged in' do
    visit('/peeps/new')
    fill_in('peep', with: 'Hey!')
    click_button('Submit')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Please sign up or login first!')
  end
end