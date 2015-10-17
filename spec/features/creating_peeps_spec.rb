feature 'Posting Peeps' do

  let(:user){ create :user }

  scenario 'there are no peeps in the database at the start of the test' do
  expect(Peep.count).to eq 0
  end

  scenario 'I can post a new peep' do
    sign_in(handle: user.handle, password: user.password)
    visit '/peeps/new'
    fill_in 'post', with: "I'm amazing"
    click_button 'Post peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content("I'm amazing")
    end
  end
end
