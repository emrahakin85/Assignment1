create table users(
user_id int primary key auto_increment,
user_name varchar(30),
group_id int null references groups
);

insert into users(user_name, group_id)
values
('Modesto', 1),
('Ayine', 1),
('Christopher', 2),
('Cheong', 2),
('Saulat', 3),
('Heidy', NULL);

select * from users;

create table groups(
group_id int primary key auto_increment,
group_name varchar(30)
);

insert into groups(group_name)
values
('IT'),
('Sales'),
('Admin'),
('Operations');

select * from groups;

create table rooms(
roomd_id int primary key auto_increment,
name varchar(30)
);

insert into rooms(Name)
values
(101),
(102),
('Auditorium A'),
('Auditorium B');

select * from rooms;

create table group_room(
group_id int not null references groups(groupid),
room_id int not null references rooms(room_id),
constraint pk_group_room primary key(group_id, room_id)
);

insert into group_room
values
(1, 1),
(1, 2),
(2, 2),
(2, 3);

select * from group_room;

# 1- All groups, and the users in each group. 
# A group should appear even if there are no users assigned to the group.
select g.group_name, u.user_name
from groups g
left join users u
on u.group_id = g.group_id;

# 2- All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
assigned to them.
select r.name as 'Room', g.group_name as 'Groups Assigned'
from rooms r
left join group_room gr on r.roomd_id = gr.room_id
left join groups g on g.group_id = gr.group_id;

# 3- A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
# alphabetically by user, then by group, then by room.

# list users groups and rooms
select u.user_name 'User Name', g.group_name 'Group', r.name 'Accessible Room'
from users u
left join groups g on u.group_id = g.group_id
left join group_room gr on gr.group_id = g.group_id
left join rooms r on gr.room_id = r.roomd_id
order by 'User Name', 'Group', 'Accessible Room';

