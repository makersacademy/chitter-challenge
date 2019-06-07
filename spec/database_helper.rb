def create_peeps 
  Peep.create(
    text: "First ever peep!!!!",
    created_at: Time.now
  )
  Peep.create(
    text: "Tweet tweet",
    created_at: Time.now
  )
  Peep.create(
    text: "I have no egrets",
    created_at: Time.now
  )
end