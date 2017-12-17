require 'orderly'
feature 'Order peeps' do
  scenario 'orders peeps in reverse chronological order' do
    peep_post_1
    peep_post_2
    expect('second peep').to appear_before('first peep')
  end
end
