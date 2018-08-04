feature " Shows all the user's posts" do
  scenario "The user opens his home page and sees posts" do
    connection = PG.connect(dbname: 'user_tweets_test')

      User.create_tweet(content: 'This is my first tweet')
      User.create_tweet(content: 'This is my second tweet')
      User.create_tweet(content: 'This is my fifteenth tweet')

    # Visit the page
    visit('/user')

    expect(page).to have_content "This is my first tweet"
    expect(page).to have_content "This is my second tweet"
    expect(page).to have_content "This is my fifteenth tweet"

  end
end
