require 'spec_helper'

feature 'User posts a new peep' do

  def add_peep(post)
    fill_in :post, :with => post
    click_button "Add peep"
  end

  scenario 'when signed in' do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep("Hello World!")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.post).to eq('Hello World!')
  end

end