feature "index" do
  scenario 'post button should not appear if not signed up' do
    visit '/peeps'
    expect(page).not_to have_selector(:link_or_button, 'Post')
  end

  scenario 'page should have multiple peeps listed' do
    sign_up_user
    post_a_peep
    post_another_peep
    expect(page).to have_content('I feel grrrrrreat')
    expect(page).to have_content('I really do')
  end

  scenario 'page should show name and user handle with peeps' do
    sign_up_user
    post_a_peep
    expect(page).to have_content('test user')
    expect(page).to have_content('@test_user1')
  end
end
