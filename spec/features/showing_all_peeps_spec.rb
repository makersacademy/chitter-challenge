require_relative '../helper_methods.rb'
feature 'Viewing peeps' do

  scenario 'on the homepage' do
    add_peep
    visit '/'
    expect(page).to have_content('test')
  end

  scenario 'in reverse chronological order' do
    add_peep '1st'
    sleep 1.0
    add_peep '2nd'
    sleep 1.0
    add_peep '3rd'
    visit '/'
    expect(page).to have_content('peeps: "3rd"
      reply peeps: "2nd" reply peeps: "1st" reply')
    expect(page).not_to have_content('test')
  end

end
