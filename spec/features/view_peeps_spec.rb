feature 'FEATURE: viewing peeps' do
  include Helpers

  before do
    sign_up
  end

  scenario 'peeps are shown in reverse chronological order' do
    post_peep("oldest message")
    post_peep("older message")
    post_peep("old message")
    post_peep("new message")
    expect("new message").to appear_before "old message"
    expect("old message").to appear_before "older message"
    expect("older message").to appear_before "oldest message"
  end

  scenario 'peeps are shown with a time stamp' do
    post_peep
    time_stamp = DateTime.now.strftime(Chitter::TIME_STAMP_FORMAT)
    expect(page).to have_content "#{time_stamp}:\nHello"
  end

  scenario 'peeps are shown with an author' do
    post_peep
    expect(page).to have_content "user123 peeped"
  end
end
