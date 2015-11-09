feature 'Viewing Peeps' do
  scenario 'Date and time shown correctly' do
    now = DateTime.new(2015, 11, 07, 0, 0, 0, "+00:00")
    allow(DateTime).to receive(:now).and_return now
    post_a_peep_as_signed_in_user
    expect(page).to have_content 'Sat, 7 Nov 2015 00:00:00 +0000'
  end
end
