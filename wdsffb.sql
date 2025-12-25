CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    is_host BOOLEAN,
    is_guest BOOLEAN
);

INSERT INTO Users VALUES
(1, 'Arjun Reddy', 'arjun@example.com', '9876543210', TRUE, FALSE),
(2, 'Meera Nair', 'meera@example.com', '9876501234', FALSE, TRUE),
(3, 'Ravi Kumar', 'ravi@example.com', '9876512345', TRUE, TRUE),
(4, 'Priya Shetty', 'priya@example.com', '9876523456', FALSE, TRUE),
(5, 'Vikram Iyer', 'vikram@example.com', '9876534567', TRUE, TRUE);
CREATE TABLE Properties (
    property_id INT PRIMARY KEY,
    host_id INT,
    title VARCHAR(100),
    type VARCHAR(50),
    description TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    price_per_night DECIMAL(10,2),
    FOREIGN KEY (host_id) REFERENCES Users(user_id)
);

INSERT INTO Properties VALUES
(101, 1, 'Cozy Flat near MG Road', 'Apartment', '2BHK apartment in Bengaluru city center', 'Bengaluru', 'Karnataka', 'India', 2500.00),
(102, 3, 'Beachside Villa', 'Villa', 'Luxury villa near Kochi beach', 'Kochi', 'Kerala', 'India', 4000.00),
(103, 5, 'Hi-Tech City Studio', 'Studio', 'Modern studio near IT hub', 'Hyderabad', 'Telangana', 'India', 2200.00),
(104, 3, 'Heritage Home Stay', 'House', 'Traditional Tamil style home', 'Chennai', 'Tamil Nadu', 'India', 3000.00),
(105, 1, 'Mysuru Palace View Room', 'Room', 'Room with beautiful city view', 'Mysuru', 'Karnataka', 'India', 1800.00);
CREATE TABLE Amenities (
    amenity_id INT PRIMARY KEY,
    amenity_name VARCHAR(50) UNIQUE
);

INSERT INTO Amenities VALUES
(1, 'WiFi'),
(2, 'Air Conditioning'),
(3, 'Kitchen'),
(4, 'Parking'),
(5, 'Swimming Pool');
CREATE TABLE PropertyAmenities (
    property_id INT,
    amenity_id INT,
    PRIMARY KEY(property_id, amenity_id),
    FOREIGN KEY(property_id) REFERENCES Properties(property_id),
    FOREIGN KEY(amenity_id) REFERENCES Amenities(amenity_id)
);

INSERT INTO PropertyAmenities VALUES
(101, 1),
(101, 2),
(102, 1),
(102, 5),
(103, 1),
(103, 3),
(104, 1),
(104, 3),
(105, 1),
(105, 4);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    property_id INT,
    check_in DATE,
    check_out DATE,
    status VARCHAR(20),
    FOREIGN KEY(guest_id) REFERENCES Users(user_id),
    FOREIGN KEY(property_id) REFERENCES Properties(property_id)
);

INSERT INTO Bookings VALUES
(501, 2, 101, '2025-01-10', '2025-01-12', 'Confirmed'),
(502, 4, 102, '2025-02-05', '2025-02-08', 'Requested'),
(503, 2, 103, '2025-03-01', '2025-03-03', 'Completed'),
(504, 4, 104, '2025-01-20', '2025-01-22', 'Cancelled'),
(505, 2, 105, '2025-04-10', '2025-04-12', 'Confirmed');
