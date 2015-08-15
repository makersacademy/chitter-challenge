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
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello'
    click_button 'Submit'
    within "ul#peeps" do
      expect(page).to have_content 'Hello'
    end
  end

  scenario 'can see posted time' do
    sign_in
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello'
    click_button 'Submit'
    within "ul#peeps" do
      expect(page).to have_content '2015'
    end
  end

  scenario 'can see posted peeps' do
    sign_in
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello'
    click_button 'Submit'
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
    expect(Peep, :count).not_to change
    expect(page).to have_content "ASDF"
  end

  scenario 'there are no links in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end
end
