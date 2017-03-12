feature 'Peeping' do
  scenario 'I can post a peep when signed in' do
    sign_up
    peep
    expect(page).to have_content 'Cloud Strife - @buster_sword'
    expect(page).to have_content 'Hello world, this is my first Peep!!'
  end
  scenario 'I cannot post a peep when not signed in' do
    expect(page).not_to have_button 'Peep'
  end
end
