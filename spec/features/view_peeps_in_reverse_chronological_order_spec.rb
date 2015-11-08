feature 'Viewing peeps' do
  scenario 'peeps in reverse chronological order' do
    now = DateTime.new(2015, 11, 07, 0, 0, 0, "+00:00")
    allow(DateTime).to receive(:now).and_return now
    post_a_peep_as_signed_in_user
    now = DateTime.new(2015, 11, 07, 0, 0, 5, "+00:00")
    allow(DateTime).to receive(:now).and_return now
    post_a_peep_as_signed_in_user_2
    expect(page).to have_content 'Practice makes perfect!'
    expect(page).to have_content 'I feel mysterious today!'

    expect(page.body.index('Practice makes perfect!')).to be <
           page.body.index('I feel mysterious today!')
  end
end


