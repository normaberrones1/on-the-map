INSERT INTO users (username, email, password, full_name, role)
VALUES
('johndoe', 'johndoe@example.com', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'John Doe', 'ROLE_USER'),
('janedoe', 'janedoe@example.com', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'Jane Doe', 'ROLE_ADMIN');


INSERT INTO trips (user_id, destination, start_date, end_date, total_cost, budget, savings)
VALUES
(1, 'Paris', '2025-06-01', '2025-06-10', 2000.00, 2500.00, 500.00),
(2, 'Tokyo', '2025-08-01', '2025-08-15', 3000.00, 3500.00, 500.00);


INSERT INTO places (trip_id, name, latitude, longitude, place_type, visited_on)
VALUES
(1, 'Eiffel Tower', 48.8584, 2.2945, 'visited', '2025-06-02'),
(1, 'Louvre Museum', 48.8606, 2.3376, 'visited', '2025-06-04');

INSERT INTO places (trip_id, name, latitude, longitude, place_type)
VALUES
(2, 'Shibuya Crossing', 35.6581, 139.7017, 'bucket_list'),
(2, 'Mount Fuji', 35.3606, 138.7274, 'bucket_list');


INSERT INTO social_posts (user_id, trip_id, post_text, post_date)
VALUES
(1, 1, 'Having an amazing time at the Eiffel Tower!', '2025-06-02 10:00:00'),
(2, 2, 'Exploring Tokyo’s vibrant streets and culture.', '2025-08-05 14:00:00');


INSERT INTO bucket_list (user_id, place_name, latitude, longitude)
VALUES
(1, 'Grand Canyon', 36.1069, -112.1129),
(2, 'Santorini', 36.3932, 25.4615);


INSERT INTO tasks (trip_id, description, due_date, task_type)
VALUES
(1, 'Book flight tickets', '2025-05-15', 'before_trip'),
(1, 'Reserve hotel', '2025-05-20', 'before_trip');

INSERT INTO tasks (trip_id, description, due_date, task_type)
VALUES
(2, 'Visit Shibuya Crossing', '2025-08-02', 'during_trip'),
(2, 'Climb Mount Fuji', '2025-08-10', 'during_trip');


INSERT INTO map_markings (user_id, place_name, latitude, longitude, marking_type)
VALUES
(1, 'Eiffel Tower', 48.8584, 2.2945, 'visited'),
(1, 'Santorini', 36.3932, 25.4615, 'bucket_list');

INSERT INTO map_markings (user_id, place_name, latitude, longitude, marking_type)
VALUES
(2, 'Shibuya Crossing', 35.6581, 139.7017, 'visited'),
(2, 'Grand Canyon', 36.1069, -112.1129, 'bucket_list');
