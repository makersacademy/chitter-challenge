feature 'posting to chitter' do
  let!(:user) { create :user }

  scenario 'can see form to post chitter' do
    sign_in
    visit '/peeps/new'
    expect(page.status_code).to eq 200
    expect(page).to have_content "What's on your mind?"
    expect(page).to have_button 'Submit'
  end

  scenario 'have button new chitter' do
    visit '/peeps'
    expect(page).to have_button 'New Peep'
  end

  scenario 'can see posted peeps' do
    sign_in
    post_peep
    within "ul#peeps" do
      expect(page).to have_content 'Hello'
    end
  end

  scenario 'can see posted time' do
    sign_in
    post_peep
    within "ul#peeps" do
      expect(page).to have_content '2015'
    end
  end

  scenario 'can see posted peeps' do
    sign_in
    post_peep
    within "ul#peeps" do
      expect(page).to have_content 'Hello'
    end
  end

  scenario 'must sign in before posting' do
    visit '/peeps/new'
    expect(page).to have_content "Sign in first"
  end

  scenario 'cannot post empty peep' do
    sign_in
    visit '/peeps/new'
    click_button 'Submit'
    expect(Peep.count).to eq 0
    expect(page).to have_content "Cannot be empty"
  end

  scenario 'will always see latest post first' do
    sign_in
    post_peep
    post_peep(message: 'A')
    post_peep(message: 'B')
    expect(page).to have_content "Timeline B"
  end

  scenario 'there are no links in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end
end
