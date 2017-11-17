def new_peep(content)
  visit ('/')
  click_on('New peep')
  fill_in 'content', with: content
  click_on('Peep it')
end

def cancelled_peep
  visit ('/')
  click_on('New peep')
  fill_in 'content', with: 'Test peep'
  click_on('Cancel')
end
