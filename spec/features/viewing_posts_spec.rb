feature 'Viewing tips' do
  scenario 'On the tips page I can see a list of tips' do
    Post.create(tip: 'drink 8 cups of water')
    visit '/posts'

    expect(page.status_code).to eq 200

    within 'ul#posts' do
      expect(page).to have_content 'drink 8 cups of water'
    end
  end
end
