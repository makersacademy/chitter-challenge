feature 'posting to chitter' do
  scenario 'can see form to post chitter' do
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
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello'
    click_button 'Submit'
    within "ul#peeps" do
      expect(page).to have_content 'Hello'
    end
  end

  scenario 'there are no links in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end
end
