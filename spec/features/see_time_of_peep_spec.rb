feature 'Time of peep' do
  before do
    new_time = Time.local(2017, 7, 2, 12, 29, 0)
    Timecop.freeze(new_time)
  end

  scenario 'See the time a peep was posted' do
    post_multiple_peeps
    expect(current_path).to eq('/peeps')
    within 'ul#peeps' do
      expect(page).to have_content('Peeped on 02/07/2017, at 12:29PM')
    end
  end
end
