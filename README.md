# Financial Fraud Detection Analytics System

A comprehensive data analytics platform for detecting and analyzing financial fraud patterns using PostgreSQL and interactive dashboard visualizations.

## 🎯 Project Overview

This system processes over 5 million transactions worth $1.79 billion, providing real-time fraud detection capabilities with a sophisticated multi-dimensional analysis approach. The platform achieves a 3.59% fraud detection rate with advanced risk scoring and pattern recognition.

## 🏗️ Architecture

### Database Schema
- **Transactions Table**: Core transaction data with 20+ attributes including fraud indicators, risk scores, and device information
- **Account Dimension**: Sender/receiver account classification and status tracking  
- **Date Dimension**: Comprehensive time-based analysis with holiday and weekday detection
- **Optimized Indexing**: Strategic indexes on timestamp, amount, transaction type, and account fields

### Key Features
- **Real-time Risk Scoring**: Multi-factor risk assessment using geo-anomaly, spending deviation, velocity, and transaction amount
- **Channel Performance Analysis**: Cross-channel fraud rate comparison (Wire Transfer: 3.60%, UPI: 3.59%, ACH: 3.58%, Card: 3.59%)
- **Temporal Pattern Detection**: Hourly, daily, and seasonal fraud trend analysis
- **Device-based Segmentation**: Mobile, web, ATM, and POS transaction monitoring
- **Interactive Filtering**: Dynamic data exploration by date, risk score, transaction type, and fraud indicators

## 📊 Dashboard Components

### 1. Executive Summary
- Transaction volume and value metrics
- YoY fraud rate improvement (-98.47%)
- Transaction distribution by type and amount range
- High-level KPI monitoring

### 2. Channel Performance  
- Payment channel fraud rate comparison
- Device usage patterns and risk assessment
- Transaction volume distribution across channels

### 3. Risk Analysis
- Risk score distribution and correlation matrix
- High-risk transaction identification
- Multi-factor risk assessment visualization

### 4. Fraud Detection
- Real-time fraud rate trending with moving averages
- Transaction type fraud analysis
- Amount-based fraud pattern recognition
- Card presence vs. fraud correlation

### 5. Transaction Analysis
- Hourly transaction patterns and fraud rates
- Daily volume trends and anomaly detection
- Calendar-based transaction analysis

## 🔍 Key Insights

- **Fraud Distribution**: Evenly distributed across transaction types (3.58-3.63% range)
- **Risk Factors**: Independent contribution of geo-anomaly, spending patterns, and velocity
- **Temporal Patterns**: Consistent hourly fraud rates with slight variations (3.51-3.66%)
- **Amount Correlation**: Higher fraud rates in lower transaction amounts
- **Channel Security**: Wire transfers show marginally higher fraud rates

## 🛠️ Technical Stack

- **Database**: PostgreSQL with optimized indexing
- **Analytics**: SQL-based data modeling and aggregation
- **Visualization**: Interactive dashboard framework
- **Performance**: Indexed queries for real-time analysis

## 📈 Performance Metrics

- **Data Volume**: 5M+ transactions, $1.79B+ value
- **Processing Speed**: Real-time analysis with indexed queries
- **Detection Accuracy**: Multi-dimensional risk scoring
- **Coverage**: 24/7 monitoring across all payment channels

## 🚀 Getting Started

1. **Database Setup**: Execute SQL scripts in order:
   - `create_transactions_table.sql`
   - `create_account_dimension.sql`
   - `create_date_dimension.sql`

2. **Data Population**: Load transaction data and populate dimension tables

3. **Dashboard Configuration**: Configure visualization components with database connections

4. **Monitoring**: Set up real-time monitoring and alerting thresholds

## 📊 Use Cases

- Financial institutions fraud prevention
- Real-time transaction monitoring
- Risk assessment and scoring
- Regulatory compliance reporting
- Business intelligence and analytics

## 🤝 Contributing

Contributions welcome! Please read our contributing guidelines and submit pull requests for any improvements.

