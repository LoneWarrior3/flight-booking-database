CREATE DATABASE shivu;
USE shivu;

CREATE TABLE travel_classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100) UNIQUE
);
INSERT INTO travel_classes (class_id, class_name) 
VALUES 
    (1, 'aEconomy'),
    (2, 'Business'),
    (3, 'aFirst Class'),
    (4, 'Premium Economy'),
    (5, NULL);
    
CREATE TABLE seat_price (
    flight_id INT PRIMARY KEY,
    airline_id INT NOT NULL,
    seat_id INT NOT NULL,
    price INT NOT NULL
);
INSERT INTO seat_price (flight_id, airline_id, seat_id, price)
VALUES 
    (1, 1, 1, 2000),
    (2, 2, 2, 3000),
    (3, 3, 3, 5400),
    (4, 4, 4, 6250),
    (5, 5, 5, 1350);


CREATE TABLE route (
    route_id INT PRIMARY KEY,
    origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL
);
INSERT INTO route (route_id, origin, destination) 
VALUES 
    (1, 'New York', 'Los Angeles'),
    (2, 'London', 'Paris'),
    (3, 'Tokyo', 'Seoul'),
    (4, 'Sydney', 'Melbourne'),
    (5, 'Dubai', 'Singapore');

CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY,
    day_of_journey VARCHAR(100) NOT NULL,
    date_of_journey DATE,
    route_id INT NOT NULL,
    arrival_time TIME NOT NULL,
    departure_time TIME NOT NULL,
    FOREIGN KEY (route_id) REFERENCES route(route_id)
);
INSERT INTO schedule (schedule_id, day_of_journey, date_of_journey, route_id, arrival_time, departure_time) 
VALUES 
    (1, 'Monday', '2024-04-01', 1, '08:00:00', '10:00:00'),
    (2, 'Tuesday', '2024-04-02', 2, '09:00:00', '11:00:00'),
    (3, 'Wednesday', '2024-04-03', 3, '10:00:00', '12:00:00'),
    (4, 'Thursday', '2024-04-04', 4, '11:00:00', '13:00:00'),
    (5, 'Friday', '2024-04-05', 5, '12:00:00', '14:00:00');

CREATE TABLE airline (
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR(100) UNIQUE,
    nationality VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    customer_care_no VARCHAR(100) NOT NULL
);
INSERT INTO airline (airline_id, airline_name, nationality, email, customer_care_no) 
VALUES 
    (1, 'Delta', 'USA', 'delta@gmail.com', '123-456-7890'),
    (2, 'British Airways', 'UK', 'britishairways@gmail.com', '987-654-3210'),
    (3, 'ANA', 'Japan', 'ana@gmail.com', '456-789-0123'),
    (4, 'Qantas', 'Australia', 'qantas@gmail.com', '321-654-0987'),
    (5, 'Emirates', 'UAE', 'emirates@gmail.com', '789-012-3456');

CREATE TABLE flight (
    flight_id INT PRIMARY KEY,
    airline_id INT NOT NULL,
    route_id INT NOT NULL,
    schedule_id INT NOT NULL,
    total_seats INT NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES airline(airline_id),
    FOREIGN KEY (route_id) REFERENCES route(route_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id)
);
INSERT INTO flight (flight_id, airline_id, route_id, schedule_id, total_seats) 
VALUES 
    (1, 1, 1, 1, 200),
    (2, 2, 2, 2, 250),
    (3, 3, 3, 3, 180),
    (4, 4, 4, 4, 220),
    (5, 5, 5, 5, 300);

CREATE TABLE seats (
    seat_id INT PRIMARY KEY,
    class_id INT NOT NULL,
    flight_id INT NOT NULL,
    airline_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES travel_classes(class_id),
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id),
    FOREIGN KEY (airline_id) REFERENCES airline(airline_id)
);
INSERT INTO seats (seat_id, class_id, flight_id, airline_id) 
VALUES 
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 3),
    (4, 4, 4, 4),
    (5, 5, 5, 5);

CREATE TABLE passenger (
    p_id INT PRIMARY KEY,
    p_firstname VARCHAR(100),
    p_lastname VARCHAR(100),
    age INT,
    email_address VARCHAR(100),
    passport INT,
    address VARCHAR(100)
);
INSERT INTO passenger (p_id, p_firstname, p_lastname, age, email_address, passport, address) 
VALUES 
    (1, 'John', 'Doe', 30, 'john.doe@example.com', 123456789, '123 Main St, Anytown'),
    (2, 'Jane', 'Smith', 25, 'jane.smith@example.com', 987654321, '456 Elm St, Anytown'),
    (3, 'Michael', 'Johnson', 40, 'michael.johnson@example.com', 456789123, '789 Oak St, Anytown'),
    (4, 'Emily', 'Brown', 35, 'emily.brown@example.com', 654321987, '321 Pine St, Anytown'),
    (5, 'David', 'Wilson', 45, 'david.wilson@example.com', 987123654, '987 Cedar St, Anytown');

CREATE TABLE ticket_cancellation (
    b_id INT PRIMARY KEY,
    p_id INT,
    flight_id INT,
    refund INT,
    cancellation_status VARCHAR(100),
    reason VARCHAR(100),
    FOREIGN KEY (p_id) REFERENCES passenger(p_id),
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id)
);
INSERT INTO ticket_cancellation (b_id, p_id, flight_id, refund, cancellation_status, reason) 
VALUES 
    (1, 1, 1, 50, 'completed', 'change of plans'),
    (2, 2, 2, 75, 'completed', 'medical emergency'),
    (3, 3, 3, 100, 'completed', 'flight delay'),
    (4, 4, 4, 25, 'completed', 'personal reasons'),
    (5, 5, 5, 0, 'pending', 'unknown reason');


CREATE TABLE booking (
    b_id INT PRIMARY KEY,
    p_id INT NOT NULL,
    flight_id INT,
    seat_id INT,
    airline_id INT,
    payment_mode VARCHAR(100),
    payment_status VARCHAR(100),
    FOREIGN KEY (p_id) REFERENCES passenger(p_id),
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id),
    FOREIGN KEY (airline_id) REFERENCES airline(airline_id)
);


INSERT INTO booking (b_id, p_id, flight_id, seat_id, airline_id, payment_mode, payment_status) 
VALUES 
    (1, 1, 1, 1, 1, 'credit card', 'completed'),
    (2, 2, 2, 2, 2, 'debit card', 'completed'),
    (3, 3, 3, 3, 3, 'cash', 'completed'),
    (4, 4, 4, 4, 4, 'UPI', 'completed'),
    (5, 5, 5, 5, 5, 'net banking', 'pending');
SELECT * FROM travel_classes;
SELECT * FROM seat_price;
SELECT * FROM route;
SELECT * FROM schedule;
SELECT * FROM airline;
SELECT * FROM flight;
SELECT * FROM seats;
SELECT * FROM passenger;
select * from ticket_cancellation;
select * from booking;

/*booking a ticket*/
INSERT INTO booking (b_id, p_id, flight_id, seat_id, airline_id, payment_mode, payment_status) 
VALUES (7, 5, 5, 5, 5, 'net banking', 'pending');

/*1.Search for Available Flights: */ 
SELECT  
    f.flight_id, 
    a.airline_name, 
    r.origin, 
r.destination, 
s.date_of_journey, 
s.departure_time, 
s.arrival_time, 
f.total_seats - COUNT(b.b_id) AS available_seats 
FROM  
flight f 
INNER JOIN  
airline a ON f.airline_id = a.airline_id 
INNER JOIN  
route r ON f.route_id = r.route_id 
INNER JOIN  
schedule s ON f.schedule_id = s.schedule_id 
LEFT JOIN  
booking b ON f.flight_id = b.flight_id 
WHERE  
r.origin = 'Dubai'  
AND r.destination = 'Singapore'  
AND s.date_of_journey = '2024-04-05' 
GROUP BY  
f.flight_id, a.airline_name, r.origin, r.destination, s.date_of_journey, 
s.departure_time, s.arrival_time, f.total_seats;


/*2.2. View Booking History:  */
SELECT  
p.p_firstname, 
p.p_lastname, 
b.b_id, 
f.airline_id, 
r.origin, 
r.destination, 
s.date_of_journey, 
b.payment_status 
FROM  
passenger p 
INNER JOIN  
booking b ON p.p_id = b.p_id 
INNER JOIN  
flight f ON b.flight_id = f.flight_id 
INNER JOIN  
route r ON f.route_id = r.route_id 
INNER JOIN  
schedule s ON f.schedule_id = s.schedule_id 
WHERE  
p.p_id = '2';

/*To Cancel a Ticket:*/
UPDATE  
booking 
SET  
payment_status = 'canceled' 
WHERE  
b_id = '3';


/*Retrieve available flights based on origin, destination, and date of 
travel*/
SELECT  
f.flight_id, 
f.airline_id, 
s.schedule_id, 
s.date_of_journey, 
s.departure_time, 
s.arrival_time, 
f.total_seats - COUNT(b.b_id) AS available_seats 
FROM  
flight f 
INNER JOIN  
schedule s ON f.schedule_id = s.schedule_id 
LEFT JOIN  
booking b ON f.flight_id = b.flight_id 
INNER JOIN  
route r ON f.route_id = r.route_id 
WHERE  
r.origin = 'New York' 
AND r.destination = 'Los Angeles' 
AND s.date_of_journey = '2024-04-01' 
GROUP BY  
f.flight_id, f.airline_id, s.schedule_id, s.date_of_journey, s.departure_time, 
s.arrival_time, f.total_seats 
HAVING  
available_seats > 0;


/*Check Flight Cancellation details: */
select
f.flight_id, 
f.airline_id, 
s.schedule_id, 
s.date_of_journey, 
s.departure_time, 
s.arrival_time, 
tc.cancellation_status, 
tc.reason 
FROM  
flight f 
INNER JOIN  
schedule s ON f.schedule_id = s.schedule_id 
INNER JOIN  
ticket_cancellation tc ON f.flight_id = tc.flight_id 
WHERE  
tc.cancellation_status = 'completed';


/*total revenue generated by each airline*/
SELECT  
a.airline_id, 
a.airline_name, 
SUM(sp.price) AS total_revenue 
FROM  
airline a 
INNER JOIN  
seat_price sp ON a.airline_id = sp.airline_id 
GROUP BY  
a.airline_id, a.airline_name;


CREATE VIEW flight_schedule_view AS
SELECT 
    f.flight_id,
    f.airline_id,
    f.route_id,
    s.schedule_id,
    s.day_of_journey,
    s.date_of_journey,
    s.departure_time,
    s.arrival_time
FROM 
    flight f
INNER JOIN 
    schedule s ON f.schedule_id = s.schedule_id;
select * from flight_schedule_view;

CREATE VIEW available_flights_view AS
SELECT 
    f.flight_id,
    a.airline_name,
    r.origin,
    r.destination,
    s.date_of_journey,
    s.departure_time,
    s.arrival_time,
    f.total_seats - COUNT(b.b_id) AS available_seats
FROM 
    flight f
INNER JOIN 
    airline a ON f.airline_id = a.airline_id
INNER JOIN 
    route r ON f.route_id = r.route_id
INNER JOIN 
    schedule s ON f.schedule_id = s.schedule_id
LEFT JOIN 
    booking b ON f.flight_id = b.flight_id
GROUP BY 
    f.flight_id, a.airline_name, r.origin, r.destination, s.date_of_journey, s.departure_time, s.arrival_time, f.total_seats;

 select * from available_flights_view;
 
 CREATE VIEW booking_details_view AS
SELECT 
    b.b_id,
    b.p_id,
    p.p_firstname,
    p.p_lastname,
    p.age,
    p.email_address,
    f.airline_id,
    f.route_id,
    b.payment_mode,
    b.payment_status
FROM 
    booking b
INNER JOIN 
    passenger p ON b.p_id = p.p_id
INNER JOIN 
    flight f ON b.flight_id = f.flight_id;
select * from booking_details_view;


CREATE VIEW passenger_manifest_view AS
SELECT 
    b.b_id,
    b.p_id,
    p.p_firstname,
    p.p_lastname,
    p.age,
    b.seat_id,
    b.airline_id
FROM 
    booking b
INNER JOIN 
    passenger p ON b.p_id = p.p_id;
select * from passenger_manifest_view;


CREATE VIEW revenue_by_airline_view AS
SELECT 
    f.airline_id,
    a.airline_name,
    SUM(s.price) AS total_revenue
FROM 
    booking b
INNER JOIN 
    flight f ON b.flight_id = f.flight_id
INNER JOIN 
    seat_price s ON f.flight_id = s.flight_id
INNER JOIN 
    airline a ON f.airline_id = a.airline_id
GROUP BY 
    f.airline_id, a.airline_name;
select * from revenue_by_airline_view;


CREATE VIEW user_profile_view AS
SELECT 
    p.p_id,
    p.p_firstname,
    p.p_lastname,
    p.email_address
FROM 
    passenger p;
select * from user_profile_view;



