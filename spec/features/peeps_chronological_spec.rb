require 'helpers'

feature 'Peeps reverse chronological order --' do
  include Helpers

  scenario 'User to see peeps in reverse chronological order' do
    sign_up
    peep_helper
    sleep(1)
    peep_helper_2
    expect("My second peep!").to appear_before("My first peep!")
  end
end
