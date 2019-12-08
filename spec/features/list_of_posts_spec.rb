feature 'Posts' do
  scenario 'user can see a list of posts' do
    visit '/chitter'
    expect(page).to have_content "1st post"
    expect(page).to have_content "2nd post"
    expect(page).to have_content "3rd post"
  end
end