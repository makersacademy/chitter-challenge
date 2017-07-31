feature 'peeps show in reverse order (i.e. newest first)' do
  let(:old_comment) { 'old comment' }
  let(:new_comment) { 'new comment' }
  before do
    sign_up
    log_in('Dave', '12345')
  end
  scenario 'two comments' do
    new_peep(old_comment)
    new_peep(new_comment)
    expect(new_comment).to appear_before(old_comment)
  end
end
