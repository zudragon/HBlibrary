create table hb_reading(
chairnum varchar2(4000),
time varchar2(4000),
yes_no varchar2(4000) check(yes_no='yes' or yes_no='no'),
id varchar2(4000) primary key
)

insert into hb_reading values(1, null, 'no', 1)


create table hb_member(
id varchar2(4000) primary key,
pwd varchar2(4000),
name varchar2(4000),
profile varchar2(4000),
regdate varchar2(4000)
)
