feature 'Viewing posts and time' do
  scenario 'check there are posts with timestamps listed' do
    Post.create(chit: "Test chit 01")

    visit('/posts')

    expect(page).to have_content 'Peep:'
    expect(page).to have_content 'Test chit 01'
    expect(page).to have_content 'Posted On:'
    expect(page).to have_content(Time.now.hour)
    expect(page).to have_content(Time.now.min)
  end
end
