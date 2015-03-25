create table hb_reading(
chairnum varchar2(4000),
time varchar2(4000),
yes_no varchar2(4000) check(yes_no='yes' or yes_no='no'),
id varchar2(4000) primary key
)

insert into hb_reading values(1, null, 'no', 1)



create table hb_class(
classnum varchar2(4000),
time varchar2(4000),
used varchar2(4000) check(used='yes' or used='no')
id varchar2(4000),
email varchar2(4000),
sub_id1 varchar2(4000),
sub_id2 varchar2(4000),
sub_id3 varchar2(4000),
sub_id4 varchar2(4000),
sub_id5 varchar2(4000),
sub_email1 varchar2(4000),
sub_email2 varchar2(4000),
sub_email3 varchar2(4000),
sub_email4 varchar2(4000),
sub_email5 varchar2(4000),
)




create table hb_member(
id varchar2(4000) primary key,
pwd varchar2(4000),
name varchar2(4000),
profile varchar2(4000),
regdate varchar2(4000)
)