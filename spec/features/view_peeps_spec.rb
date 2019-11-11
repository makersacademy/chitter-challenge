feature 'viewing all peeps' do
  scenario 'the user can see the title on the homepage' do
    visit '/peeps'
    expect(page).to have_content "Recent peeps"
  end

  scenario 'the user can see all peeps' do
    visit '/peeps'
    expect(page).to have_content "Recent peeps"
  end
end
