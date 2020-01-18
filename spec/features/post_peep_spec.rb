feature 'Post a Peep' do
  scenario 'User posts a peep using a form' do
    visit '/'
    click_link 'Write a Peep'
    fill_in 'text', :with => 'My first peep'
    click_button 'Share Peep'
    expect(page).to have_content 'My first peep'
  end
end