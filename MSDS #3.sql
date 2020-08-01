DROP TABLE IF EXISTS off_users CASCADE;

Drop table if exists off_groups cascade;

drop table if exists off_rooms cascade;

CREATE TABLE if not exists off_users (user_id int primary key, user_name varchar(120));

insert into off_users(user_id, user_name) values (1, 'Modesto');
insert into off_users(user_id, User_name) values (2, 'Ayine');
insert into off_users(user_id, user_name) values (3, 'Christopher');
insert into off_users(user_id, user_name) values (4, 'Cheng Woo');
insert into off_users(user_id, user_name) values (5, 'Saulat');
insert into off_users(user_id, user_name) values (6, 'Heidy');
DESC off_users;

create table off_groups (group_id int primary key, group_name varchar(120), user_id int null references off_users);

insert into off_groups (group_id, group_name, user_id) values (1, 'I.T', 1);
insert into off_groups (group_id, group_name, user_id) values (1, 'I.T', 2);
insert into off_groups (group_id, group_name, user_id) values (2, 'sales', 3);
insert into off_groups (group_id, group_name, user_id) values (2, 'sales', 4);
insert into off_groups (group_id, group_name, user_id) values (3, 'administration',5);
insert into off_groups (group_id, group_name, user_id) values (4, 'Operations', 6);
DESC off_groups;

create table off_rooms (room_id int primary key, room_name varchar(50) not null, group_id int null references off_groups);

insert into off_rooms (room_id, room_name, group_id) values (1, '101',1);
insert into off_rooms (room_id, room_name, group_id) values (2, '102',2);
insert into off_rooms (room_id, room_name, group_id) values (3, '102',3);
insert into off_rooms (room_id, room_name, group_id) values (4, 'Auditorium A', 4);
insert into off_rooms (room_id, room_name, group_id) values (5, 'Auditorium B', NULL);
desc off_rooms;



select b.group_id, b.group_name FROM off_users a right join off_groups b on a.user_id = b.user_id;

select b.room_id, b.room_name, a.group_id, a.group_name FROM off_groups a right join off_rooms b on a.group_id = b.group_id;

#'A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
#alphabetically by user, then by group, then by room.'



SELECT * FROM off_users;
select * from off_groups;
select * from off_rooms;


SELECT a.user_id   AS userid, 
       a.user_name AS employee_name, 
       b.group_name, 
       c.room_name 
FROM   off_users a 
       LEFT JOIN off_groups b 
              ON a.user_id 
        OUTER JOIN off_rooms c 
                    ON b.group_id 
ORDER  BY a.user_name, 
          b.group_name, 
          c.room_name; 