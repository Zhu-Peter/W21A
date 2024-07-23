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
    primary key (id)
);
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
);
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

-- Create a procedure that takes 0 arguments and returns all items id, name, description, quantity_in_stock and created_at
create procedure get_all_items()
    select * from items;
-- Create a procedure that takes 3 arguments as a name, description and quantity_in_stock, inserts a new item into the table and returns the newly created items id
create procedure insert_new_item(name varchar(255), description varchar(255), in_stock_quantity int)
    insert into items (name, description, in_stock_quantity) values (name, description, in_stock_quantity);
-- Create a procedure that takes 2 arguments, an id and number and updates the item with the matching id to have the number added to quantity_in_stock and returns the items new quantity_in_stock
create procedure update_item_quantity(id int, num int)
    update items set in_stock_quantity = in_stock_quantity + num where id = id;
-- Create a procedure that takes 1 argument, an id deletes the item with the matching id
create procedure delete_item(id int)
    delete from items where id = id;
-- Create a procedure that takes 1 argument, an id and returns the employee name, position, hired_at and hourly_wage with that particular id
create procedure get_employee_by_id(employee_id int)
    select * from employees where id = employee_id;
-- Create a procedure that takes 3 arguments as a name, position and hourly_wage, inserts a new employee into the table and returns the newly created employee id
create procedure insert_new_employee(name varchar(255), position varchar(255), hourly_wage int)
    insert into employees (name, position, hourly_wage) values (name, position, hourly_wage);
-- Create a procedure that takes 2 arguments, an id and number and updates the employee with the matching id to have the a new hourly_wage and return that new hourly_wage
create procedure update_employee_wage(id int, num int)
    update employees set hourly_wage = hourly_wage + num where id = id;
-- Create a procedure that takes 1 argument an id and deletes the employee with the matching id
create procedure delete_employee(employee_id int)
    delete from employees where id = employee_id;