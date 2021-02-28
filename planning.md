# Planning

## User Stories

[Helpful link - www.gov.uk advice on creating user stories](https://www.gov.uk/service-manual/agile-delivery/writing-user-stories)

### Story 1

> As a Maker,
>
> So that I can let people know what I am doing,
>
> I want to post a message (peep) to chitter.

### Nouns/verbs 1

Nouns:

* Message/peep
* Chitter

Verbs:

* Post

### Story 2

> As a Maker,
>
> So that I can see what others are saying,
>
> I want to see all peeps in reverse chronological order.

### Nouns/verbs 2

Nouns:

* Peeps

Verbs:

* See (reverse chronological order)

### Story 3

> As a Maker,
>
> So that I can better appreciate the context of a peep,
>
> I want to see the time at which it was made.

### Nouns/verbs 3

Nouns:

* Time

Verbs:

* See
* Made

### Story 4

> As a Maker,
>
> So that I can post messages on Chitter as me,
>
> I want to sign up for Chitter.

### Nouns/verbs 4

Nouns:

* Chitter

Verbs:

* Sign up

### Story 5

> As a Maker,
>
> So that only I can post messages on Chitter as me,
>
> I want to log in to Chitter.

### Nouns/verbs 5

Nouns:

* Chitter

Verbs:

* Log in

### Story 6

> As a Maker,
>
> So that I can avoid others posting messages on Chitter as me,
>
> I want to log out of Chitter.

### Nouns/verbs 6

Nouns:

* Chitter

Verbs:

* Log out

## CRCs

| Class: Peep |  |
| ------- | ---------- |
| __Responsibilities__ | __Collaborators__ |
| Knows time peep posted |  |
| Knows content of peep |  |
|  |  |

| Class: Chitter |  |
| ------- | ---------- |
| __Responsibilities__ | __Collaborators__ |
| Keeps record of peeps | Peep |
| Allows user to post peeps | User |
| Displays peeps to user |  |

| Class: User |  |
| ------- | ---------- |
| __Responsibilities__ | __Collaborators__ |
| Allows user to sign up | Chitter |
| Knows log in info |  |
| Knows log out info |  |

Thinking about the database, the tables might look like this:

| Peeps | | | |
| --- | --- | --- | --- |
| id (primary key) | content (VARCHAR(144)) | timestamp | user id (foreign key) |

| Users | | |
| --- | --- | --- | 
| id | email | password | 

## Sequence Diagram

[diagram.codes](https://playground.diagram.codes/d/sequence)

````ruby

```
