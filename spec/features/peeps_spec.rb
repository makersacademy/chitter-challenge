feature 'List all peeps' do
  scenario 'user can see all peeps in reverse chronological order' do
    post_a_peep
    post_another_peep
    expect('second peep').to appear_before('blablabla!')
  end
end
