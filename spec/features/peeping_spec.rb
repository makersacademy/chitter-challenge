feature 'PEEPING' do

  scenario '-> lets users peep a message with their name & username visible' do
    sign_up
    sign_in
    peep
    expect(page).to have_content('Look at my breakfast - johnson, mr_johnson')
  end
end
