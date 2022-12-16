drop DATABASE app;
create database IF NOT EXISTS app;
use app;
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
    value_int     float                                 null,
    value_string  text                                  null,
    hardware_type int                                   not null,
    timestamp     timestamp default current_timestamp() null,
    constraint hardware_hardware_type_fk
        foreign key (hardware_type) references hardware_type (id)
)
    comment 'Tabelle für Messdaten';

create table if not exists limit_type
(
    id   int auto_increment
        primary key,
    name text null
);

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

create table if not exists threshold
(
    id            int auto_increment
        primary key,
    value       float                                 null comment 'Soft Limit in Prozent',
    hardware_type int                                   null,
    limit_type    int                                   null,
    timestamp     timestamp default current_timestamp() null,
    constraint threshold_hardware_type_id_fk
        foreign key (hardware_type) references hardware_type (id),
    constraint threshold_limit_type_id_fk
        foreign key (limit_type) references limit_type (id)
);


INSERT INTO app.hardware_type (id, name) VALUES (1, 'CPU count');
INSERT INTO app.hardware_type (id, name) VALUES (2, 'CPU utilization');
INSERT INTO app.hardware_type (id, name) VALUES (3, 'RAM available');
INSERT INTO app.hardware_type (id, name) VALUES (4, 'RAM used (percent)');
INSERT INTO app.hardware_type (id, name) VALUES (5, 'RAM used (absolute)');
INSERT INTO app.hardware_type (id, name) VALUES (6, 'Free disk space');
INSERT INTO app.hardware_type (id, name) VALUES (7, 'Used disk space (percent)');
INSERT INTO app.hardware_type (id, name) VALUES (8, 'Users');

INSERT INTO app.log_type (id, name) VALUES (1, 'Hardware');
INSERT INTO app.log_type (id, name) VALUES (2, 'Webserver Access');
INSERT INTO app.log_type (id, name) VALUES (3, 'Webserver Error Log');

INSERT INTO app.limit_type (id, name) VALUES (1, 'Soft Limit');
INSERT INTO app.limit_type (id, name) VALUES (2, 'Hard Limit');
