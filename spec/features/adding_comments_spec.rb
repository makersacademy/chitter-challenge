feature 'Adding comments' do

  scenario 'User adds a comment' do
    register
    fill_in 'peep', with: 'My first peep'
    click_button 'Post'
    within('div', id: "1") do
      click_button 'Comments'
    end
    fill_in 'comment', with: 'My first comment'
    click_button 'Comment'

    expect(page).to have_content 'My first comment'
    expect(page).to have_content 'Commentator: georgeyporgey'
  end

end
