feature 'Viewing peeps' do

  before(:each) do
    sign_up_first
  end

  scenario 'I can view peeps in reverse chronological order' do
    post_a_peep(test_peep_one)
    post_a_peep(test_peep_two)
    expect(test_peep_two).to appear_before(test_peep_one)
  end

end
