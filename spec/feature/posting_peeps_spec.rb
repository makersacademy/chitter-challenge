feature 'Posting peeps' do
  scenario "should be able to post peeps" do
    visit '/peeps/new'
    fill_in 'message', with: "I am posting my first peep"
    click_button 'Post peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content "I am posting my first peep"
    end
  end
end
