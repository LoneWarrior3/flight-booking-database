# ✈️ Flight Booking Management System - DBMS Mini Project

This project simulates a **Flight Booking Management System** using **MySQL**. It allows users to manage flights, airlines, schedules, passengers, bookings, cancellations, and view reports like available flights, revenues, and user profiles. The schema is fully normalized with appropriate foreign key constraints and views.

---

## 🧱 Database Schema Overview

The project includes the following tables:

- `airline` – Stores airline details
- `flight` – Contains flight info linked to airline, route, and schedule
- `route` – Stores origin-destination pairs
- `schedule` – Stores date, arrival, and departure times for flights
- `passenger` – Stores user/passenger details
- `booking` – Tracks bookings by passengers on flights
- `ticket_cancellation` – Tracks cancellations with refund info
- `travel_classes` – Classifies seats (Economy, Business, etc.)
- `seats` – Maps class to airline and flight
- `seat_price` – Stores price per seat/class/airline
- ✅ Multiple `views` for reporting and analytics

---

## 📁 Files

| File Name         | Description                            |
|------------------|----------------------------------------|
| `schema.sql`      | All table creation and insert queries  |
| `views.sql`       | View creation queries                  |
| `queries.sql`     | Common SELECT, JOIN, and search queries|
| `README.md`       | Project documentation                  |

---

## 🔧 Technologies Used

- **MySQL**
- **SQL (DDL, DML, Views, Joins)**
- **Workbench / phpMyAdmin / XAMPP / CLI**

---

## 🔍 Key Features

- ✅ Manage Flights, Routes, Airlines, and Passengers  
- ✅ Book or Cancel Tickets  
- ✅ Calculate Seat Availability in Real-Time  
- ✅ View Booking History and Cancellation Reasons  
- ✅ Generate Reports:  
  - Revenue by Airline  
  - Flight Schedule  
  - Passenger Manifest  
  - Available Flights on Specific Date  

---

## 🛠️ How to Run

1. Open MySQL Workbench or any SQL IDE
2. Run `schema.sql` to create the database and insert initial data
3. Run `views.sql` to create necessary views
4. Use `queries.sql` to test operations like searching flights, booking, canceling, and reports

---

## 📊 Sample Views Created

- `flight_schedule_view`  
- `available_flights_view`  
- `booking_details_view`  
- `passenger_manifest_view`  
- `revenue_by_airline_view`  
- `user_profile_view`

---

## 🙋‍♂️ Author

**Shiva Kumar Uppara**  
📧 u.shivakumar3333@gmail.com   
[🔗 LinkedIn](https://linkedin.com/in/shivakumar33)  
[🐙 GitHub](https://github.com/LoneWarrior3)

---

## 🌟 Contribution & Usage

This project is designed for academic and learning purposes. Feel free to fork, star, or contribute.  
For improvements or bugs, raise an issue or pull request.

---

## 📜 License

This project is open-source and free to use under the [MIT License](LICENSE).
