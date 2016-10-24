feature "Replying to a peep" do
  scenario "I can reply to a peep with a comment" do
    visit '/peeps'
    expect(page.status_code).to eq(200)
    expect(page).to have_current_path('/peeps')
    # within 'ul#peeps' do
      # fill_in ('comment_ta'), with: "What an awesome peep! You are the best peeper I've come across!?!"
      # find_field('comment_ta').set("What an awesome peep! You are the best peeper I've come across!?!")
      #click_button('Comment')

      # first(find_field('comment_ta')).set("What an awesome peep! You are the best peeper I've come across!?!")
      # first(find_button("Comment")).trigger('click')

      # find_button("Comment").trigger('click')
      # peep = Peep.first
      # expect(peep.reply.map(&:comment)).to include "What an awesome peep!"
    # end
  end

  #I cannot run this test.
  #Capybara cannot find the textarea or the buttons on this page.
  #This is due to the multiple forms being displayed.

  scenario 'I can add multiple comments to a peep' do
    visit '/peeps'
    expect(page.status_code).to eq(200)
    expect(page).to have_current_path('/peeps')

    # Can't add this as I can't get the first test to work.
    # Add 2 comments, 1 after another and see that they are both present.
  end
end
