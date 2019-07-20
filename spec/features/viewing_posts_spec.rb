feature 'Viewing posts' do
  scenario 'A user can see posts' do
    visit('/posts')

    expect(page).to have_content "I am awake"
    expect(page).to have_content "I have eaten"
    expect(page).to have_content "I will sleep"
  end
end
