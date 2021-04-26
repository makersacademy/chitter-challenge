feature 'Peeps are posted in reverse chronological order' do
  scenario 'User posts a peep and can see it at the top of the peepstream' do
    visit '/'
    fill_in('peep', with: 'Hello world')
    click_button('Post your peep')
    visit '/'
    fill_in('peep', with: 'My first peep')
    click_button('Post your peep')
    expect(page.find('li:nth-child(1)')).to have_content 'My first peep'
    expect(page.find('li:nth-child(2)')).to have_content 'Hello world'
  end
end
