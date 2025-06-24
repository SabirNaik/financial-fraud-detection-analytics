-- Create a transactions table to match our dataset structure
CREATE TABLE transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    timestamp TIMESTAMP,
    sender_account VARCHAR(50),
    receiver_account VARCHAR(50),
    amount DECIMAL(15,2),
    transaction_type VARCHAR(20),
    merchant_category VARCHAR(50),
    location VARCHAR(100),
    device_used VARCHAR(50),
    is_fraud BOOLEAN,
    fraud_type VARCHAR(50),
    time_since_last_transaction DECIMAL(10,2),
    spending_deviation_score DECIMAL(5,2),
    velocity_score DECIMAL(5,2),
    geo_anomaly_score DECIMAL(5,2),
    payment_channel VARCHAR(30),
    ip_address VARCHAR(20),
    device_hash VARCHAR(64)
);
CREATE INDEX idx_timestamp ON transactions(timestamp);
CREATE INDEX idx_amount ON transactions(amount);
CREATE INDEX idx_transaction_type ON transactions(transaction_type);
CREATE INDEX idx_is_fraud ON transactions(is_fraud);
CREATE INDEX idx_sender_account ON transactions(sender_account);
CREATE INDEX idx_receiver_account ON transactions(receiver_account);






-- Create a date dimension table for better time analysis
CREATE TABLE date_dimension (
    date_key SERIAL PRIMARY KEY,
    date_actual DATE NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL,
    month INT NOT NULL,
    month_name VARCHAR(10) NOT NULL,
    day INT NOT NULL,
    day_name VARCHAR(10) NOT NULL,
    day_of_week INT NOT NULL,
    week_of_year INT NOT NULL,
    is_weekday BOOLEAN NOT NULL,
    is_holiday BOOLEAN NOT NULL
);

-- Populate date dimension table based on transaction dates
INSERT INTO date_dimension (
    date_actual, year, quarter, month, month_name, 
    day, day_name, day_of_week, week_of_year, is_weekday, is_holiday
)
SELECT DISTINCT
    CAST(DATE("timestamp") AS DATE) AS date_actual,
    EXTRACT(YEAR FROM "timestamp") AS year,
    EXTRACT(QUARTER FROM "timestamp") AS quarter,
    EXTRACT(MONTH FROM "timestamp") AS month,
    TO_CHAR("timestamp", 'Month') AS month_name,
    EXTRACT(DAY FROM "timestamp") AS day,
    TO_CHAR("timestamp", 'Day') AS day_name,
    EXTRACT(DOW FROM "timestamp") AS day_of_week,
    EXTRACT(WEEK FROM "timestamp") AS week_of_year,
    CASE WHEN EXTRACT(DOW FROM "timestamp") BETWEEN 1 AND 5 THEN TRUE ELSE FALSE END AS is_weekday,
    FALSE AS is_holiday
FROM transactions;






-- Create account dimension table
CREATE TABLE account_dimension (
account_id VARCHAR(50) PRIMARY KEY,
account_type VARCHAR(20),
account_status VARCHAR(20)
);	

-- Insert sender accounts not already in account_dimension
INSERT INTO account_dimension (account_id, account_type, account_status)
SELECT DISTINCT t.sender_account, 'Sender', 'Active'
FROM transactions t
LEFT JOIN account_dimension a ON t.sender_account = a.account_id
WHERE a.account_id IS NULL;

-- Insert receiver accounts not already in account_dimension
INSERT INTO account_dimension (account_id, account_type, account_status)
SELECT DISTINCT t.receiver_account, 'Receiver', 'Active'
FROM transactions t
LEFT JOIN account_dimension a ON t.receiver_account = a.account_id
WHERE a.account_id IS NULL;


SELECT * FROM account_dimension
