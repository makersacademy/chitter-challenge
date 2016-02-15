feature 'Posting peeps' do
  let(:user) { create(:user) }

  scenario 'User can post a peep' do
    sign_in_as(user, password: 'pass')
    visit '/peeps/new'
    fill_in :message, with: 'This is my peep'
    click_button 'Post'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is my peep'
    expect(page).to have_content "@#{user.username}"
    expect(page).to have_content user.peeps.first.message
  end

  scenario 'User needs to login before posting' do
    visit '/peeps/new'
    expect(page).to have_content 'Please sign in to post a peep.'
  end
end
