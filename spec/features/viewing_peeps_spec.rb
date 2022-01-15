feature 'Viewing peeps' do
  scenario 'user can see all peeps' do
    first_peep = Peep.add(content: 'First peep!')
    second_peep = Peep.add(content: 'Second peep!')
    third_peep = Peep.add(content: 'Third peep!')
    visit '/'

    peeps = page.all('.peep')
   
    expect(peeps[0]).to have_content "Third peep!"
    expect(peeps[1]).to have_content "Second peep!"
    expect(peeps[2]).to have_content "First peep!"
  end
end
