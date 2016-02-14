require_relative '../helpers/peeps'

feature 'I can reply to a peep' do
  include PeepHelpers
  scenario 'When I reply to a peep it is added under the peep' do
    post_a_peep
    click_link('Reply')
    expect(page).to have_content('Hello world, this is')

    fill_in('content', with:'This is a reply to the peep')

    expect{click_button('Reply')}.to change{Reply.count}.by(1)
    expect(current_path).to eq('/session')
    expect(page).to have_content('This is a reply to the peep')
  end
end
