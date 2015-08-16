feature 'posting peeps' do
  let(:user) { user = build(:user) }

  scenario 'Users can post peeps' do
    sign_up(user)
    sign_in(user)
    visit('/peeps/new')
    expect(page).to have_content('Chitter away!')
    fill_in('peep', with: 'test')
    click_button('Peep!')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('test')
    expect(page).to have_content("// #{user.user_name}")
  end

  scenario 'Users cannot post when logged out' do
    visit('/peeps/new')
    fill_in('peep', with: 'test')
    click_button('Peep!')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Please sign up or login first!')
  end

end