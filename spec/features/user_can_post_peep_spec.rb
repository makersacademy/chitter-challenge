feature 'posting peeps' do

  before do
    Timecop.freeze(Time.local(1990))
    user_sign_up("user", "user123", 'user@user.com', 'password123', 'password123')
    visit '/peeps'
    post_peep('Peeping, peeping, 123')
  end

  scenario 'user can post a peep' do
    expect(page).to have_content 'Peeping, peeping, 123'
  end

  scenario 'peep features the date and time' do
    expect(page).to have_content Time.now.strftime("%c")
  end

  scenario "peep features user's name and username" do
    expect(page).to have_content "user (user123)"
  end
end
