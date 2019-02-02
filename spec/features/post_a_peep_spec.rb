feature do
  scenario 'adds the peep to the feed' do
    submit_a_peep 'Just a test peep'
    expect(page).to have_content 'Just a test peep'
  end
end
