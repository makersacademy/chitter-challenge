feature 'FEATURE: viewing peeps' do
  include Helpers
  scenario 'peeps are shown in reverse chronological order' do
    post_peep("oldest message")
    post_peep("older message")
    post_peep("old message")
    post_peep("new message")
    expect("new message").to appear_before "old message"
    expect("old message").to appear_before "older message"
    expect("older message").to appear_before "oldest message"
  end
end
