   ## User Stories

### User Story 1
```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter
```

| Nouns         | Verbs          |
|---------------|----------------|
| Message(Peep) | post     |


### User Story 2
```
As a Maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order
```
| Nouns         | Verbs          |
|---------------|----------------|
| Message(Peep) | see all (in reverse)      |

![Diagram](./public/images/chitter-first.png)


### User Story 3
```
As a Maker
So that I can better appreciate the context of a peep 
I want to see the time at which it was made
```
| Nouns         | Verbs          |
|---------------|----------------|
| Time- (of Message(Peep)) | see     |

### User Story 4
```
As a Maker
So that I can post messages on Chitter as me 
I want to sign up for Chitter
```
| Nouns         | Verbs          |
|---------------|----------------|
| Chitter       | sign up   |



|             class Peep            |
|---------------- | --------------- |
|Responsibilities | Collaborators  |
| @post_peep      |  Chitter        |
| @show_peeps_list|           |
| @peep_time      |          |


|           class Chitter            |
|---------------- | --------------- |
|Responsibilities | Collaborators  |
| @sign_up        |           |

#### Domain Model
