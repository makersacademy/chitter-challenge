feature 'viewing posts' do
  scenario 'a user can see posts' do
    visit('/posts')
    expect(page).to have_content "peep_1"
    expect(page).to have_content "peep_2"
    expect(page).to have_content "peep_3"
    expect(page).to have_content "peep_4"
  end
end
