feature "see peeps" do

  before do
    add_example_tweets
  end

  scenario "see peeps" do
    visit '/feed'
    expect(page).to have_content 'first peep'
    expect(page).to have_content 'second peep'
    expect(page).to have_content 'third peep'
  end

  scenario "see peeps in reverse order" do

  end

end
