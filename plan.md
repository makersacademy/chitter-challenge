## Plan

I started by completing user stories 1-3 with the following plan:

### User Story 1
```bash
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
- Create peep_manager database and peep_manager_test database
- Create peeps table within both databases which has ID, message, name and handle columns.
- Create Peep class in peep.rb file and Peeps class in app.rb file

Domain Mapping:
- self.create method
- | peep | <-- create -->
- | peeps | <-- all -->

| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate peep data in a class    |
| View        | Display the result to a user                  | Show the peep data in a chronological list  |
| Controller  | Get data from the model and put in the view   | Render peep data into to the view   |

User Flow:
1. Visit page /peeps/new
2. Type out peep (include max. character count of 280 characters), name and Chitter handle
3. Submit the peep
4. See the new peep on the /peeps page, with the writer's name and Chitter handle attached

### User Story 2
```bash
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
- use self.all method created in US1 and call .reverse on the iteration
User Flow:
1. Visit page /peeps
2. See peeps in chronological order

### User Story 3
```bash
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
- use timestamp feature to view the timestamp next to each peep
- will need to create 'created_at' column in database table

User Flow:
1. Visit page /peeps
2. See peeps in chronological order with timestamp printed alongside peep

I later came back to the challenge to complete user story 4, which required making some adjustments to previous work I had done. For example, I wanted to remove the name and handle columns from the peeps table and replace then with a user_id column to capture the one-to-many relationship between a user and their peeps.

### User Story 4
```bash
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
- Create user table within both databases, which includes the following columns: user ID, email, password, and a handle
- Add user_id to peeps table

User Flow:
1. Visit page '/'
2. Click sign up button
3. Visit page /users/new
4. Fill out sign up form
5. Click submit
6. Taken to page /peeps where you can see the peeps
7. Once your peep is created, it shows on the /peeps page, along with your handle.
