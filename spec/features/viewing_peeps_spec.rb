feature 'display of peeps' do

  let(:first) { 'This is test peep 1'}
  let(:second) { 'This is test peep 2'}

  scenario 'peeps are in reverse chronological order' do
    submit_a_peep first
    submit_a_peep second
    expect(second).to appear_before first
  end

  scenario 'peeps display their time of posting' do

  end
end
