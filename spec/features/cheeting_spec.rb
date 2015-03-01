require 'spec_helper'

feature "User makes a new cheet" do
  scenario "when on the homepage" do
    expect(Cheet.count).to eq 0
    visit '/'
    cheet("What a lovely day!")
    expect(Cheet.count).to eq 1
    cheet = Cheet.first
    expect(cheet.text).to eq "What a lovely day!"
  end

  def cheet(content)
    fill_in 'content', :with => content
    click_button 'Cheet!'
  end


end