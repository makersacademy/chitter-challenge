feature 'Test post order' do
  scenario 'check posts are in reverse chronological order' do
    Post.create(chit: "Test chit 01")
    Post.create(chit: "Test chit 02")
    Post.create(chit: "Test chit 03")

    visit '/posts'

    expect(page.find('li:nth-child(1)')).to have_content 'Test chit 03'
    expect(page.find('li:nth-child(2)')).to have_content 'Test chit 02'
    expect(page.find('li:nth-child(3)')).to have_content 'Test chit 01'
  end
end
