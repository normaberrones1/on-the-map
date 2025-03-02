BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS places;
DROP TABLE IF EXISTS social_posts;
DROP TABLE IF EXISTS bucket_list;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS map_markings;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
	role VARCHAR(50) DEFAULT 'user',
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE trips (
    id SERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    destination VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    total_cost DECIMAL(10, 2) DEFAULT 0,
    budget DECIMAL(10, 2) DEFAULT 0,
    savings DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE places (
    id SERIAL PRIMARY KEY,
    trip_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    place_type VARCHAR(50) CHECK (place_type IN ('visited', 'bucket_list')) DEFAULT 'bucket_list',
    visited_on DATE,
    FOREIGN KEY (trip_id) REFERENCES trips(id) ON DELETE CASCADE
);

CREATE TABLE social_posts (
    id SERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    trip_id BIGINT NOT NULL,
    post_text TEXT,
    post_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (trip_id) REFERENCES trips(id) ON DELETE CASCADE
);

CREATE TABLE bucket_list (
    id SERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    place_name VARCHAR(255),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    added_on TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    trip_id BIGINT NOT NULL,
    description VARCHAR(255) NOT NULL,
    due_date DATE,
    completed BOOLEAN DEFAULT FALSE,
    task_type VARCHAR(50) CHECK (task_type IN ('before_trip', 'during_trip')) NOT NULL,
    completed_on TIMESTAMPTZ,
    FOREIGN KEY (trip_id) REFERENCES trips(id) ON DELETE CASCADE
);

CREATE TABLE map_markings (
    id SERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    place_name VARCHAR(255) NOT NULL,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    marking_type VARCHAR(50) CHECK (marking_type IN ('visited', 'bucket_list')) NOT NULL,
    marked_on TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

COMMIT;
