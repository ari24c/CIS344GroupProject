USE HotelReservationSystem1;

SHOW TABLES;
SELECT * FROM Guest;
SELECT * FROM Reservation;
SELECT * FROM Room;
SELECT * FROM Employee;
SELECT * FROM Manager;
SELECT * FROM Bookings;
SELECT * FROM Charges;
SELECT * FROM Transaction;
SELECT * FROM Staff;
SELECT * FROM Room Assignment;

INSERT INTO Guest (GuestID, Name, Email, PhoneNumber, ReservationID, RoomNumber)
VALUES 
(1, 'Ariana Campbell', 'ariana@example.com', 7185551234, 1001, 203),
(2, 'John Smith', 'john.smith@example.com', 2125559876,1002, 205),
(3, 'Sofia Lopez', 'sofia.lopez@example.com', 6465556543, 1003, 301);

SELECT * FROM Guest;
INSERT INTO Reservation (ReservationID, GuestID, RoomNumber, CheckIN_Date, CheckOut_Date, TransactionID)
VALUES
(1001, 1, 203, '2025-10-26', '2025-10-29', '90'),
(1002, 2, 205, '2025-11-02', '2025-11-05', '88'),
(1003, 3, 301, '2025-11-10', '2025-11-12','77');

SELECT * FROM Reservation;
SELECT 
  g.Name,
  r.ReservationID,
  r.RoomNumber,
  r.CheckIN_Date,
  r.CheckOut_Date,
  r.TransactionID
FROM Guest g
JOIN Reservation r ON g.GuestID = r.GuestID;

