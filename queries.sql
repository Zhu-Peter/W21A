-- Create a DB with the following tables / columns:
-- item
    -- id
    -- name
    -- description
    -- in_stock_quantity
    -- created_at
create table items (
    id int not null auto_increment,
    name varchar(255) not null,
    description varchar(255) not null,
    in_stock_quantity integer not null,
    created_at timestamp not null default current_timestamp,
    primary key (id),
-- employee
    -- id
    -- name
    -- position
    -- hired_at
    -- hourly_wage
create table employees (
    id int not null auto_increment,
    name varchar(255) not null,
    position varchar(255) not null,
    hired_at timestamp not null default current_timestamp,
    hourly_wage decimal(10,2) not null,
    primary key (id)
-- Insert at least 10 items and 5 employees in your DB
insert into items (name, description, in_stock_quantity) values 
    ('Item 1', 'Item 1 description', 10),
    ('Item 2', 'Item 2 description', 20),
    ('Item 3', 'Item 3 description', 30),
    ('Item 4', 'Item 4 description', 40),
    ('Item 5', 'Item 5 description', 50),
    ('Item 6', 'Item 6 description', 60),
    ('Item 7', 'Item 7 description', 70),
    ('Item 8', 'Item 8 description', 80),
    ('Item 9', 'Item 9 description', 90),
    ('Item 10', 'Item 10 description', 100);

insert into employees (name, position, hired_at, hourly_wage) values 
    ('John Smith', 'CEO', '2019-01-01 00:00:00', 1000000),
    ('Jane Doe', 'CTO', '2019-01-01 00:00:00', 120000),
    ('Bob Smith', 'Accountant', '2019-01-01 00:00:00', 70000),
    ( 'Rob Miller', 'Janitor', '2019-01-01 00:00:00', 50000),
    ( 'Jane Doe', 'Lawyer', '2019-01-01 00:00:00', 150000);