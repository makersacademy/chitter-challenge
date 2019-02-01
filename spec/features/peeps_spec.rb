feature 'peeps' do
  scenario 'form to enter peeps' do
    visit '/peeps'
    expect(page).to have_content "Peep"
    click_on "Post"
  end
end

feature 'post' do
  scenario 'post a peep' do
    visit '/peeps'
    fill_in "peep", with: "feature test peep"
    click_on "Post"
    expect(page).to have_content "Peep"
  end
end
