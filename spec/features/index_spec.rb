feature "index" do
  scenario 'should contain multiple peeps' do
    post_a_peep
    post_another_peep
    expect(page).to have_content('I feel grrrrrreat')
    expect(page).to have_content('I really do')
  end
end
