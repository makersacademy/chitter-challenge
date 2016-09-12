require 'spec_helper'
require 'orderly'

feature 'lists peeps in reverse chronological order' do
  scenario 'list in in reverse chronology' do
    post_peep
    post_second_peep
    expect("I was this second peep").to appear_before "Got such cheese munchies"
  end
end
