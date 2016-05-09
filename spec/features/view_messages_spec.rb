feature 'View Cheeps' do

  scenario 'cheeps can be viewed in reverse chronological order' do
    sign_in_and_post
    post_message(message: "cheep no. 2")
    post_message(message: "cheep no. 3")
    within('div#cheeps') do
      expect(page.body.index('cheep no. 3')).to be < page.body.index('cheep no. 2')
    end
  end

  scenario 'cheeps are displayed with the time they were created' do
    allow(Time).to receive(:now).and_return('2016-05-08T15:22:56+01:00')
    sign_in_and_post
    within('div#messages') do
      expect(page).to have_content "Posted by Megatron (best_bot, 2016-05-08T15:22:56+01:00)"
    end
  end

end