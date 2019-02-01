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
    expect(page).to have_content "feature test peep"
  end
end

feature 'date and time' do
  scenario 'it stores date and time for each post' do
    visit '/peeps'
    fill_in "peep", with: "another feature test peep"
    click_on "Post"
    expect(page).to have_content "another feature test peep [ posted on #{Time.now.to_s.split(" +")[0]}]"
  end
end
