feature 'view all peeps reverse chronologically' do
  scenario 'user is able to view the most recent peeps' do
    Peep.add(post: 'This peep should be bottom of the list')
    Peep.add(post: 'This peep should come second in the list')
    newest_post = Peep.add(post: 'This peep should be top of the list')

    visit('/chitter')
    expect(first('.peep').text).to eq "#{newest_post.timestamp} - #{newest_post.post}"
  end
end
