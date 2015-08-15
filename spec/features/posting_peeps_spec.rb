feature '#Posting peeps' do
  scenario 'Users can post peeps when logged in' do
    user = create(:user)
    sign_in_as(user)
    visit('/peeps/new')
    fill_in('peep', with: 'Hey!')
    click_button('Submit')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Hey!')
  end
end