feature 'Deleting a peep' do
  scenario 'A user can delete a bookmark' do
    post = Posts.create(peep_text: 'This is a PEEP.', user_name: 'Solo', created_at: '2019-06-22 19:10:25-07')
    visit('/posts')
    expect(page).to have_content("This is a PEEP")

    # first('.peep').click_button 'Delete'

    expect(current_path).to eq '/posts'
    # expect(page).not_to have_content("This is a PEEP")
  end
end
