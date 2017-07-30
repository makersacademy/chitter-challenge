feature 'peep shows when it was written' do
  let(:content) { 'comment' }
  let(:time_posted) { Time.now.strftime('%F %H:%M') }
  before do
    sign_up
    log_in('Dave', '12345')
  end
  scenario 'shows date and time' do
    new_peep(content)
    expect(page).to have_content("Posted at #{time_posted} ")
  end
end
