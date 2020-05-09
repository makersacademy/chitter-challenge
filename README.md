## User Stories

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

## Database

`peeps` table:

| field | type |
| --- | --- |
| id | PRIMARY SERIAL ID |
| body | VARCHAR(240) |
| created_at | DATE |

## Models

| object | message |
| --- | --- |
| | @id |
| | @body |
| | @created_at |
