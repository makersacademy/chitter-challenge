Modelling and Planning a Web application

Step 0: User stories or specification

  As a Maker
  So that I can let people know what I am doing  
  I want to post a message (peep) to chitter

  As a maker
  So that I can see what others are saying  
  I want to see all peeps in reverse chronological order

  As a Maker
  So that I can better appreciate the context of a peep
  I want to see the time at which it was made

  As a Maker
  So that I can post messages on Chitter as me
  I want to sign up for Chitter

Step 1: Planning pages

                                                ┌──────────────────────────────┐
                                                │      list of peeps           │
                                                │                              │
                                                │   -Sign up button  LINK      │                        ┌──────────────────────────┐
  ┌────────────────────────────┐                │   -List of peeps (messages)  │                        │       Sign up form       │
  │      Add a peep            │                │                              ├────────────────────────┤                          │
  │                            ├────────────────┤                              │                        │ -email                   │
  │   -content                 │                │                              │                        │ -password                │
  │   -name                    │                │                              │                        ▼ -name                    │
  │   -username                ▼                │                              │                        │ -username                │
  │                            │                │                              │                        │                          │
  │                            │                │                              │                        │                          │
  │                            │                └─────▲───────────────────────▲┘                        │                          │
  │                            │                      │                       │                         │             FORM         │
  │        FORM                ├──────────────────────┘                       │                         └──────────────────┬───────┘
  └────────────────────────────┘  Added  to the list with                     │                                            │
                                  the date                                    │                                            │
                                                                              │                                            │
                                                                              │                                            │
                                                                              │                                            │
                                                                              │                                   ┌────────▼───────┐
                                                                              │      redirect back to homepage    │ You have an    │
                                                                              │                                   │   account      │
                                                                              └───────────────────────────────────┤                │
                                                                                                                  │                │
                                                                                                                  │     LINK       │
                                                                                                                  └────────────────┘



Step 2: Planning routes

  # Page: list of peeps (messages)

  ## REQUEST:
  GET / 
  no parameters

  ## Response (200 OK)
  HTML view with list of peeps, and button for sign up


  # Page: add a peep (message)
  ## REQUEST:
  GET/add
  no parameters

  ## Response (200 OK)
  HTML view with form to submit a new peep (to POST /peeps)

  # Page: peep has been added

  ## Request:
  POST /peeps
  with Parameters:
    name:""
    username:""
    content=""
  ## Response (200 OK)
  HTML view with confirmation message (link back to homepage)


  # Page: add an account
  ## REQUEST:
  GET /signup
  no parameters

  ## Response (200 OK)
  HTML view with form to submit a new account with Chitter (to POST/signedin)

  # Page: signed up for an account
  ## REQUEST:
  POST /signedin
  with parameters:
    email:
    password
    name
    username
  ## Response (200 OK)
  HTML view with confirmation message account added (link back to homepage)


Step 3: Tets-drive and implement

