feature 'Replying peeps' do
  let(:bill) { create(:user, username: 'bill', email: 'bill@bill.com') }
  let(:bong) { create(:user, username: 'bong', email: 'bong@bong.com') }

  scenario 'Users can reply to a peep' do
    create(:peep, message: 'Need response', user: bill)
    sign_in_as(bong, password: 'pass')
    click_button 'Reply'
    fill_in :message, with: 'This is my response'
    click_button 'Post'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "@#{bong.username}"
    expect(page).to have_content 'This is my response'
    expect(page).to have_content bill.peeps.first.replys.first.message
  end
end
