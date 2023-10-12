CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PhoneNumber VARCHAR(11),
    PassportNumber VARCHAR(20),
    Age INT
);

CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY,
    AirlineName VARCHAR(100),
    ContactInformation VARCHAR(100)
);

CREATE TABLE Aircraft(
    AircraftID int PRIMARY KEY,
    AircraftName VARCHAR(100),
    AirlineID int ,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    AirlineID INT,
    AircraftID INT,
    FlightNumber VARCHAR(20),
    DepartureAirportCode VARCHAR(3),
    ArrivalAirportCode VARCHAR(3),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    ExpectedArrivalTime DATETIME,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID),
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID)

);

CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    DepartureTime DATETIME,
    DeparturePlace VARCHAR(100),
    ArrivalTime DATETIME,
    ArrivalPlace VARCHAR(100),
    TicketPrice DECIMAL(10, 2),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

CREATE TABLE Gates (
    GateID INT PRIMARY KEY,
    FlightID INT,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);


CREATE TABLE BoardingPasses (
    BoardingPassID INT PRIMARY KEY,
    PassengerID INT,
    TicketID INT,
    GateID INT,
    BoardingTime DATETIME,
    DepartureTime DATETIME,
    DeparturePlace VARCHAR(100),
    ArrivalTime DATETIME,
    ArrivalPlace VARCHAR(100),
    SeatNo INT,
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID),
    FOREIGN KEY (GateID) REFERENCES Gates(GateID)
);

CREATE TABLE Baggage (
    BaggageID INT PRIMARY KEY,
    PassengerID INT,
    BoardingPassID INT,
    Weight DECIMAL(10, 2),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (BoardingPassID) REFERENCES BoardingPasses(BoardingPassID)
);

CREATE TABLE CheckIns (
    CheckInID INT PRIMARY KEY,
    TicketID INT,
    CheckInTime DATETIME,
    BaggageID INT,
    BoardingPassID INT,
    FOREIGN KEY (BaggageID) REFERENCES Baggage(BaggageID),
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID),
    FOREIGN KEY (BoardingPassID) REFERENCES BoardingPasses(BoardingPassID)
);







INSERT INTO Passenger (PassengerID, FirstName, LastName, PhoneNumber, PassportNumber, Age)
VALUES
    (1, 'John', 'Doe', '12345678901', 'ABC12345', 35),
    (2, 'Jane', 'Smith', '98765432101', 'XYZ67890', 28),
    (3, 'Alice', 'Johnson', '5551112233', 'PQR56789', 22),
    (4, 'Bob', 'Williams', '7778889999', 'LMN45678', 45),
    (5, 'Eva', 'Brown', '4443332222', 'DEF98765', 30);

INSERT INTO Airlines (AirlineID, AirlineName, ContactInformation)
VALUES
    (1, 'Airline1', 'airline1@example.com'),
    (2, 'Airline2', 'airline2@example.com'),
    (3, 'Airline3', 'airline3@example.com'),
    (4, 'Airline4', 'airline4@example.com'),
    (5, 'Airline5', 'airline5@example.com');

INSERT INTO Aircraft (AircraftID, AircraftName, AirlineID)
VALUES
    (1, 'Aircraft1', 1),
    (2, 'Aircraft2', 2),
    (3, 'Aircraft3', 1),
    (4, 'Aircraft4', 3),
    (5, 'Aircraft5', 2);

INSERT INTO Flights (FlightID, AirlineID, AircraftID, FlightNumber, DepartureAirportCode, ArrivalAirportCode, DepartureTime, ArrivalTime)
VALUES
    (1, 1, 1, 'FL123', 'JFK', 'LAX', '2023-10-15 10:00:00', '2023-10-15 14:00:00'),
    (2, 2, 2, 'FL456', 'ORD', 'DFW', '2023-10-16 12:00:00', '2023-10-16 14:30:00'),
    (3, 1, 3, 'FL789', 'SFO', 'SEA', '2023-10-17 09:00:00', '2023-10-17 10:30:00'),
    (4, 3, 4, 'FL101', 'ATL', 'MIA', '2023-10-18 11:30:00', '2023-10-18 13:00:00'),
    (5, 2, 5, 'FL234', 'LGA', 'BOS', '2023-10-19 14:30:00', '2023-10-19 15:45:00');

INSERT INTO Tickets (TicketID, PassengerID, FlightID, DepartureTime, DeparturePlace, ArrivalTime, ArrivalPlace, TicketPrice)
VALUES
    (1, 1, 1, 1634253600, 'JFK', 1634268000, 'LAX', 350.00),
    (2, 2, 2, 1634332800, 'ORD', 1634340600, 'DFW', 280.00),
    (3, 3, 3, 1634415600, 'SFO', 1634423400, 'SEA', 180.00),
    (4, 4, 4, 1634502000, 'ATL', 1634509200, 'MIA', 210.00),
    (5, 5, 5, 1634588400, 'LGA', 1634594700, 'BOS', 150.00);

INSERT INTO Gates (GateID, FlightID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO BoardingPasses (BoardingPassID, PassengerID, TicketID, GateID, BoardingTime, DepartureTime, DeparturePlace, ArrivalTime, ArrivalPlace, SeatNo)
VALUES
    (1, 1, 1, 1, '2023-10-15 09:30:00', 1634253600, 'JFK', 1634268000, 'LAX', 12),
    (2, 2, 2, 2, '2023-10-16 11:30:00', 1634332800, 'ORD', 1634340600, 'DFW', 5),
    (3, 3, 3, 3, '2023-10-17 08:00:00', 1634415600, 'SFO', 1634423400, 'SEA', 8),
    (4, 4, 4, 4, '2023-10-18 11:00:00', 1634502000, 'ATL', 1634509200, 'MIA', 14),
    (5, 5, 5, 5, '2023-10-19 14:00:00', 1634588400, 'LGA', 1634594700, 'BOS', 7);

INSERT INTO Baggage (BaggageID, PassengerID, BoardingPassID, Weight)
VALUES
    (1, 1, 1, 25.5),
    (2, 2, 2, 18.0),
    (3, 3, 3, 22.3),
    (4, 4, 4, 30.0),
    (5, 5, 5, 15.8);

INSERT INTO CheckIns (CheckInID, TicketID, CheckInTime, BaggageID, BoardingPassID)
VALUES
    (1, 1, '2023-10-15 08:30:00', 1, 1),
    (2, 2, '2023-10-16 10:30:00', 2, 2),
    (3, 3, '2023-10-17 07:45:00', 3, 3),
    (4, 4, '2023-10-18 10:00:00', 4, 4),
    (5, 5, '2023-10-19 13:30:00', 5, 5);



ALTER TABLE Tickets
ADD ArrivalTime DATETIME;


-- Update expectedArrival time for TicketID 1
UPDATE Flights
SET ExpectedArrivalTime = '2023-10-21 14:00:00'
WHERE FlightID = 1;

-- Update expectedArrival time for TicketID 2
UPDATE Flights
SET ExpectedArrivalTime = '2023-10-21 15:30:00'
WHERE FlightID = 2;

-- Update expectedArrival time for TicketID 3
UPDATE Flights
SET ExpectedArrivalTime = '2023-10-21 16:45:00'
WHERE FlightID = 3;

-- Update expectedArrival time for TicketID 4
UPDATE Flights
SET ExpectedArrivalTime = '2023-10-21 17:15:00'
WHERE FlightID = 4;

-- Update expectedArrival time for TicketID 5
UPDATE Flights
SET ExpectedArrivalTime = '2023-10-21 18:30:00'
WHERE FlightID = 5;





SELECT
    T.TicketID,
    T.ArrivalTime AS TicketArrivalTime,
    F.ArrivalTime AS FlightArrivalTime,
    TIMEDIFF(T.ArrivalTime, F.ArrivalTime) AS TimeDifference
FROM
    Tickets AS T
INNER JOIN
    Flights AS F ON T.FlightID = F.FlightID;

