feature 'Deleting a comment' do
  before(:each) do
    sign_up
    log_in
    post_peep
    comment
    comment2
  end

  scenario 'User who made a can delete it' do
    expect{ click_button('delete_comment_5') }.to change(Comment, :count).by(-1)
    expect(page).not_to have_content('Test comment')
    expect(page).to have_content('Commenting number 2')
  end

  scenario 'Other users can\'t delete others\' comments' do
    log_out
    sign_up(name: 'Clemence Guillaume',
            username: 'clems',
            email: 'clemence.guill@gmail.com',
            password: 'clems',
            password_confirmation: 'clems')
    expect(page).not_to have_button('Delete this comment')
  end

  scenario 'Guest can\'t delete others\' comments' do
    log_out
    visit('/')
    click_button('Continue as guest')
    expect(page).not_to have_button('Delete this comment')
  end
end
