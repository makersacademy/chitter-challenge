feature "index" do
  scenario 'should contain multiple peeps' do
    post_a_peep
    post_another_peep
    expect(page).to have_content('I feel grrrrrreat')
    expect(page).to have_content('I really do')
  end

  scenario 'should show name and user handle of poster after signing up' do
    sign_up_user
    post_a_peep
    expect(page).to have_content('test user')
    expect(page).to have_content('@test_user1')
  end
end
