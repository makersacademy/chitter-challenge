feature 'Peeps\' order' do
  scenario 'See peeps in reverse chronological order' do
    post_multiple_peeps
    expect(current_path).to eq('/peeps')
    expect('This is my third peep').to appear_before('This is my first peep')
  end
end
