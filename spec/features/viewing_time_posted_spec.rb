feature 'Seeing time posted' do
  scenario 'User posts a peep and can see when it was posted' do
    sign_up_and_log_in
    peep_example
    expect(page).to have_content 'Posted at'
  end
end
