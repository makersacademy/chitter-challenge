-- for testing purposes, all passwords in these tests are BCrypt hashes of 'password123'

TRUNCATE TABLE peeps, users, peeps_users RESTART IDENTITY;

INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('Hello, I am Wendy!', '2022-01-01 01:01:01', 'Wendy', 'wendy0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('I am named after Bon Jovi...', '2022-02-02 02:02:02', 'Jovi', 'jovi0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('How YOU doin?', '2022-03-03 03:03:03', 'Joey', 'joey0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('Could I BE more sorry?', '2022-04-04 04:04:04', 'Chandler', 'chandler0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('You ate my sandwhich?!', '2022-05-05 05:05:05', 'Ross', 'ross0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('Princess Consuela Bananahammock', '2022-06-06 06:06:06', 'Phoebe', 'phoebe0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('I got off the plane.', '2022-07-07 07:07:07', 'Rachel', 'rachel0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('Does anybody care what kind of potatoes I want!?', '2022-08-08 08:08:08', 'Monica', 'monica0');

INSERT INTO users (email, password, f_name, handle) VALUES ('wendy0@example.com', '$2a$12$V44T0Eq3xxxd23IsnMW62u9YB1QPxlmgjfI8k4qR8.p1XCDhbsNji', 'Wendy', 'wendy0');
INSERT INTO users (email, password, f_name, handle) VALUES ('jovi0@example.com', '$2a$12$w7CRsE4w1P05Dj1XCatTreptjPzFhhbbjtpvZnPyo87S3x0IRlvKe', 'Jovi', 'jovi0');
INSERT INTO users (email, password, f_name, handle) VALUES ('joey0@example.com', '$2a$12$pFbgt3dTIK8wujdOTQygLuypLJvQX03AfBKSQqIfcFK1LglOnCQb.', 'Joey', 'joey0');
INSERT INTO users (email, password, f_name, handle) VALUES ('chandler0@example.com', '$2a$12$z0bqmInOTFmO/6kHzCUvp.1IymcLnnvo02EWkGeabjy3WhIzBzKU2', 'Chandler', 'chandler0');
INSERT INTO users (email, password, f_name, handle) VALUES ('ross0@example.com', '$2a$12$g.uD4wgPp4Npo5Qf2t8Bg.25suYGDnVa6iwmsvuZ29j9oK.2014Ja', 'Ross', 'ross0');
INSERT INTO users (email, password, f_name, handle) VALUES ('phoebe0@example.com', '$2a$12$FdLzoJWdAiTRVBUIUZtLEeso.ZTo5Ue7ynWH.rtU715O8dUKzGxCi', 'Phoebe', 'phoebe0');
INSERT INTO users (email, password, f_name, handle) VALUES ('rachel0@example.com', '$2a$12$V2/mMDtqkI.S2cZAfLAVo.dcCDDxiPH/gpVNcOYmdXtqMVuTw18dq', 'Rachel', 'rachel0');
INSERT INTO users (email, password, f_name, handle) VALUES ('monica0@example.com', '$2a$12$eSirpTEv1OyNwmcs3i7b5OkBp.xWX0jQhOJ94mDrOepI6OJVh2/9O', 'Monica', 'monica0');

INSERT INTO peeps_users (peep_id, user_id) VALUES (1, 1);
INSERT INTO peeps_users (peep_id, user_id) VALUES (2, 2);
INSERT INTO peeps_users (peep_id, user_id) VALUES (3, 3);
INSERT INTO peeps_users (peep_id, user_id) VALUES (4, 4);
INSERT INTO peeps_users (peep_id, user_id) VALUES (5, 5);
INSERT INTO peeps_users (peep_id, user_id) VALUES (6, 6);
INSERT INTO peeps_users (peep_id, user_id) VALUES (7, 7);
INSERT INTO peeps_users (peep_id, user_id) VALUES (8, 8);