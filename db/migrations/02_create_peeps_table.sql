CREATE TABLE peeps("id" SERIAL PRIMARY KEY,
                   "created" TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
                   "message" VARCHAR(1000),
                   "username" VARCHAR(15),
                   "subject" VARCHAR(60)
                  );
