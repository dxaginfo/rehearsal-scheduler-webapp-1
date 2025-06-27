-- PostgreSQL schema for Rehearsal Scheduler

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(128),
  email VARCHAR(256) UNIQUE,
  role VARCHAR(32) NOT NULL,
  password_hash VARCHAR(255),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE studios (
  id SERIAL PRIMARY KEY,
  name VARCHAR(128),
  location TEXT,
  contact_info TEXT
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  studio_id INT REFERENCES studios(id),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  status VARCHAR(32),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE attendance (
  id SERIAL PRIMARY KEY,
  booking_id INT REFERENCES bookings(id),
  user_id INT REFERENCES users(id),
  attended BOOLEAN DEFAULT FALSE,
  timestamp TIMESTAMP DEFAULT NOW()
);

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  booking_id INT REFERENCES bookings(id),
  user_id INT REFERENCES users(id),
  amount NUMERIC(10,2),
  payment_status VARCHAR(32),
  ts TIMESTAMP DEFAULT NOW()
);
