require 'orderly'

feature 'adding a post' do
    scenario 'loading new post page' do
    visit ('/')
    click_button 'New'
    expect(page).to have_content('Chii')
  end

    scenario 'adding post' do
    visit ('/')
    click_button 'New'
    fill_in('msg', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end

feature 'list all posts' do
    scenario 'display posts on mainpage' do
    visit ('/new')
    fill_in('msg', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end

  feature 'Re orders list' do
    scenario 'display posts on mainpage in new order' do
    visit ('/new')
    fill_in('msg', with: "tet")
    click_button 'Submit'
    click_button 'New'
    fill_in('msg', with: "tes434t345")
    click_button 'Submit'
    click_button 'New'
    fill_in('msg', with: "tesffft")
    click_button 'Submit'
    expect("tes434t345").to appear_before("tet")
    end
end


  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a post' do
      post = Post.create(msg: 'HarloHARlo')

      visit '/bookmarks'
      first('.bookmark').click_button 'Add Comment'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

      fill_in 'comment', with: 'This is a second comment'
      click_button 'Submit'

      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content 'this is a test comment on this bookmark'
    end
  end
end
