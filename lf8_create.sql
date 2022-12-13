create database IF NOT EXISTS lf8_test;
use lf8_test;
create table if not exists hardware_type
(
    id   int auto_increment
        primary key,
    name text not null
)
    comment 'Typ der Messung';

create table if not exists hardware
(
    id            int auto_increment
        primary key,
    value         int null,
    hardware_type int null,
    constraint hardware_hardware_type_fk
        foreign key (hardware_type) references hardware_type (id)
)
    comment 'Tabelle für Messdaten';

create table if not exists log
(
    id        bigint unsigned auto_increment
        primary key,
    log       text                                  not null,
    timestamp timestamp default current_timestamp() not null,
    constraint id
        unique (id)
);

create table if not exists log_type
(
    id   int auto_increment
        primary key,
    name text not null
)
    comment 'Typ des Logeintrags';

