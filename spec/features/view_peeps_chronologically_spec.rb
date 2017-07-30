feature 'Viewing peeps' do
  scenario 'I can view peeps in reverse chronological order' do
    post_a_peep(test_peep_one)
    post_a_peep(test_peep_two)
    expect(test_peep_two).to appear_before(test_peep_one)
  end
end
