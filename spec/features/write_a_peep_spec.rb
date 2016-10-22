require 'spec_helper'

describe 'writing a peep' do

  scenario 'logged in user writes a peep and can see it' do
    create_user
    sign_in
    write_a_peep
    expect(page).to have_content "Hello World!"
  end

  scenario 'logged in user writes a peep and it is saved' do
    create_user
    sign_in
    write_a_peep
    expect(Peep.first.text).to eq "Hello World!"
  end

end
