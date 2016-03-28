feature 'Deleting a peep:' do

  before(:each) do
    sign_up
    log_in
    post_peep
    comment
  end

  scenario 'User who posted a chitter can delete it' do
    post_peep2
    expect(page).to have_content('Test post')
    expect(page).to have_xpath('//input[@type="hidden"][@name="delete_id"]')
    expect{ delete_peep }.to change(Post, :count).by(-1)
    expect(page).not_to have_content('Test post')
  end

  scenario 'Other users can\'t delete others\' post' do
    log_out
    sign_up(name: 'Clemence Guillaume',
            username: 'clems',
            email: 'clemence.guill@gmail.com',
            password: 'clems',
            password_confirmation: 'clems')
    expect(page).not_to have_button('Delete this peep')
  end

  scenario 'Guest can\'t delete others\'post' do
    log_out
    visit('/')
    click_button('Continue as guest')
    expect(page).not_to have_button('Delete this peep')
  end
end
