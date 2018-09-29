feature 'send a message' do
  scenario 'upload a message' do
    sign_in_and_tweet
    expect(page).to have_content "ahoy mateys, here's me 'ahoy world'!"
  end
end

feature 'expect to see post time' do
  scenario 'sees time posted' do
    sign_in_and_tweet
    expect(page).to have_text(Time.now.strftime("Posted on %m/%d at %I:%M%p"))
  end
end