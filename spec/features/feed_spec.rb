feature 'Feed' do
  scenario 'I can add a peep to the feed' do
    peep("This is my first peep!")
    expect(current_path).to eq '/feed'
    expect(page).to have_content('This is my first peep!')
  end

  # scenario 'I want to see when the peep was created' do
  #   time= Time.now
  #   peep("This is a time test")
  #   expect(current_path).to eq '/feed'
  #   expect(page).to have_content(time)
  # end
end