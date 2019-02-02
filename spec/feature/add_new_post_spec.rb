feature 'Add posts' do
  scenario 'user can add post' do

    visit('/posts/new')

    fill_in('chit', with: 'Test chit 04')
    click_button('Add Chit!')

    expect(page).to have_content 'Test chit 04'
  end
end
