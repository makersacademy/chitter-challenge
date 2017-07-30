feature 'posting peeps' do

  before do
    Timecop.freeze(Time.local(1990))
  end

  scenario 'user can post a peep' do
    user_sign_up("user", "user123", 'user@user.com', 'password123')
    post_peep('Peeping, peeping, 123')
    visit '/peeps'
    expect(page).to have_content 'Peeping, peeping, 123'
  end

  scenario 'peep features the date and time' do
    visit '/peeps/new'
    user_sign_up("user", "user123", 'user@user.com', 'password123')
    post_peep('Peeping, peeping, 123')
    visit '/peeps'
    expect(page).to have_content Time.now.strftime("%c")
  end
end
