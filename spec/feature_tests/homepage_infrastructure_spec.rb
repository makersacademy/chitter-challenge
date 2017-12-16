time = Time.new.strftime("%A, %d %b %Y %l:%M %p")

feature 'Homepage' do
  scenario 'the user should be able to post a peep' do
    peep_hello
    expect(page).to have_content 'Hello you chitters'
  end

  # scenario 'the homepage displays peeps in reverse chronological order' do
  #   peep_hello
  #   peep_christmas
  #
  # end

  scenario 'the user should be to see the time a peep was posted' do
    peep_hello
    expect(page).to have_content "#{time}"
  end


end
