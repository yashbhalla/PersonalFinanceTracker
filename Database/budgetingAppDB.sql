CREATE DATABASE budgetingAppDB;

USE budgetingAppDB;

CREATE SEQUENCE user_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR2(100),
    Email VARCHAR2(100) UNIQUE,
    Password VARCHAR2(255),
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE SEQUENCE transaction_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE budget_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE goal_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    UserID INT,
    Amount DECIMAL(10, 2),
    Type VARCHAR2(10),
    Category VARCHAR2(100),
    TransactionDate DATE,
    Description CLOB,
    CONSTRAINT chk_type CHECK (Type IN ('Income', 'Expense')),
    CONSTRAINT fk_user FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Budgets (
    BudgetID INT PRIMARY KEY,
    UserID INT,
    Category VARCHAR2(100),
    LimitAmount DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Goals (
    GoalID INT PRIMARY KEY,
    UserID INT,
    GoalName VARCHAR2(100),
    TargetAmount DECIMAL(10, 2),
    CurrentAmount DECIMAL(10, 2),
    Deadline DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
