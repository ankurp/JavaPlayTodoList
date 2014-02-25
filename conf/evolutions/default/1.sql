# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table todo_item (
  id                        varchar(255) not null,
  text                      varchar(255),
  constraint pk_todo_item primary key (id))
;

create sequence todo_item_seq;




# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists todo_item;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists todo_item_seq;

