create sequence hibernate_sequence start 1 increment 1;

    create table form_responses (
        id int8 not null,
        completed boolean,
        submit_date timestamp,
        form_id int8,
        respondent_user_id int4,
        primary key (id)
    );

    create table form_responses_item_responses (
        FormResponse_id int8 not null,
        itemResponses_id int8 not null
    );

    create table forms (
        id int8 not null,
        available boolean not null,
        create_date timestamp,
        description varchar(255),
        title varchar(255),
        update_date timestamp,
        author_user_id int4,
        primary key (id)
    );

    create table item_responses (
        id int8 not null,
        item_id int8,
        primary key (id)
    );

    create table ItemResponse_responses (
        ItemResponse_id int8 not null,
        responses varchar(255)
    );

    create table items (
        item_discriminator varchar(31) not null,
        id int8 not null,
        available boolean not null,
        description varchar(255),
        helpText varchar(255),
        item_type int4,
        order_num int4,
        required boolean not null,
        title varchar(255),
        single_response boolean,
        form_id int8,
        primary key (id)
    );

    create table pdf (
        id int8 not null,
        available boolean not null,
        name varchar(255),
        upload_date timestamp,
        form_id int8,
        user_user_id int4,
        primary key (id)
    );

    create table pdf_field (
        id int4 not null,
        available boolean not null,
        description varchar(255),
        name varchar(255),
        pdf_id int8,
        primary key (id)
    );

    create table pdf_field_items (
        pdf_field_id int4 not null,
        items_id int8 not null
    );

    create table selections (
        id int4 not null,
        index int4 not null,
        value varchar(255),
        item_id int8,
        primary key (id)
    );

    create table users (
        user_id int4 not null,
        active boolean,
        address1 varchar(255),
        address2 varchar(255),
        city varchar(255),
        country varchar(255),
        phone_cell varchar(255),
        phone_home varchar(255),
        phone_work varchar(255),
        state varchar(255),
        zip varchar(255),
        email varchar(255),
        first_name varchar(255),
        last_name varchar(255),
        role varchar(255),
        user_name varchar(255),
        primary key (user_id)
    );

    alter table form_responses_item_responses 
        add constraint UK_dbp70abaivtg94nmqv7xcsvst unique (itemResponses_id);

    alter table pdf_field_items 
        add constraint UK_jw5f2efelj8pytn4qik64wtca unique (items_id);

    alter table users 
        add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email);

    alter table form_responses 
        add constraint FKfbepy10fuom3c3u41cr547u7d 
        foreign key (form_id) 
        references forms;

    alter table form_responses 
        add constraint FKdbfwpfafu547awgk1umxx5s38 
        foreign key (respondent_user_id) 
        references users;

    alter table form_responses_item_responses 
        add constraint FKb8bvwxf53vdwhjtapg0ia26ri 
        foreign key (itemResponses_id) 
        references item_responses;

    alter table form_responses_item_responses 
        add constraint FKpdg6dlctqsx0cwowysk8j3qlf 
        foreign key (FormResponse_id) 
        references form_responses;

    alter table forms 
        add constraint FKhbsm1uwxudupkqv948k2msjb9 
        foreign key (author_user_id) 
        references users;

    alter table item_responses 
        add constraint FKmt96s2icfrnypa3yixh23jxtb 
        foreign key (item_id) 
        references items;

    alter table ItemResponse_responses 
        add constraint FKsw3i2edyrsvtcaol2ha8197p5 
        foreign key (ItemResponse_id) 
        references item_responses;

    alter table items 
        add constraint FKs9tppjb3ydx8oy02h4a5h7rpb 
        foreign key (form_id) 
        references forms;

    alter table pdf 
        add constraint FK1dmiu50tta5rhde5jdh1xyqn3 
        foreign key (form_id) 
        references forms;

    alter table pdf 
        add constraint FKb7u3htpvu7ft2ykeagfx9xudi 
        foreign key (user_user_id) 
        references users;

    alter table pdf_field 
        add constraint FKn4gis1mi2hmn14uuipt141fwg 
        foreign key (pdf_id) 
        references pdf;

    alter table pdf_field_items 
        add constraint FKfs3qj8cr54r2k4mb4nx5vfavj 
        foreign key (items_id) 
        references items;

    alter table pdf_field_items 
        add constraint FKj5x1egbklrktxcuwl0knxmo84 
        foreign key (pdf_field_id) 
        references pdf_field;

    alter table selections 
        add constraint FK3e4bb6tdn617kgnv324pcc0pn 
        foreign key (item_id) 
        references items;

insert into users (user_name, user_id, active, address1, address2, city, country, phone_cell, phone_home, phone_work, state, zip, email, first_name, last_name, role) 
values ('userADMIN', 1, true, '123 address1', '123 address2', 'Los Angeles', 'USA', '111-555-8287', '111-555-8287', '111-555-8287', 'CA', '12345', 'ADMIN@email.com', 'ADMIN', 'ADMIN', 'ADMIN');

insert into users (user_name, user_id, active, address1, address2, city, country, phone_cell, phone_home, phone_work, state, zip, email, first_name, last_name, role) 
values ('userSTAFF', 2, true, '123 address1', '123 address2', 'Los Angeles', 'USA', '111-555-8287', '111-555-8287', '111-555-8287', 'CA', '12345', 'STAFF@email.com', 'STAFF', 'STAFF', 'STAFF');

insert into users (user_name, user_id, active, address1, address2, city, country, phone_cell, phone_home, phone_work, state, zip, email, first_name, last_name, role) 
values ('userUSER', 3, true, '123 address1', '123 address2', 'Los Angeles', 'USA', '111-555-8287', '111-555-8287', '111-555-8287', 'CA', '12345', 'USER@email.com', 'USER', 'USER', 'USER');

INSERT INTO forms(
    id, available, create_date, description, title, update_date, author_user_id)
    VALUES (1, true, current_date, 'Form description1', 'Form Title1', current_date, 1);
INSERT INTO forms(
    id, available, create_date, description, title, update_date, author_user_id)
    VALUES (2, true, current_date, 'Form description2', 'Form Title2', current_date, 1);

INSERT INTO items(
    item_discriminator, id, available, description, helptext, item_type, order_num, required, title, single_response, form_id)
    VALUES ('TEXT', 1, true, 'text description', null, 3, 1, false, 'text question', null, 1);
INSERT INTO items(
    item_discriminator, id, available, description, helptext, item_type, order_num, required, title, single_response, form_id)
    VALUES ('TEXT', 2, true, 'text description', null, 3, 1, false, 'text question', null, 1);

INSERT INTO items(
    item_discriminator, id, available, description, helptext, item_type, order_num, required, title, single_response, form_id)
    VALUES ('CHECKBOX', 3, true, 'checkbox description', null, 1, 0, false, 'checkbox question', false, 1);
INSERT INTO selections(
    id, index, value, item_id)
    VALUES (1, 1, 'selection choice', 3);

INSERT INTO items(
    item_discriminator, id, available, description, helptext, item_type, order_num, required, title, single_response, form_id)
    VALUES ('CHECKBOX', 4, true, 'checkbox description', null, 1, 1, false, 'checkbox question', true, 1);
INSERT INTO selections(
    id, index, value, item_id)
    VALUES (2, 1, 'selection choice_1', 4);
INSERT INTO selections(
    id, index, value, item_id)
    VALUES (3, 2, 'selection choice_2', 4);
INSERT INTO selections(
    id, index, value, item_id)
    VALUES (4, 3, 'selection choice_3', 4);