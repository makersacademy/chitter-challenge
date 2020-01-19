feature 'Posting peeps' do
  scenario 'Post a peep' do
    sign_up
    fill_in "peeps", with: "I'm Shaun"
    click_button "Tweet"
    expect(page).to have_content "I'm Shaun"
  end
end
