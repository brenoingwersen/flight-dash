/*SQL script for initializing the database*/

-- Create a new user
CREATE USER newuser WITH ENCRYPTED PASSWORD 'user';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE "flight-delays" TO newuser;
GRANT ALL PRIVILEGES ON TABLE public.flights TO newuser;
GRANT ALL PRIVILEGES ON TABLE public.airlines TO newuser;
GRANT ALL PRIVILEGES ON TABLE public.airports TO newuser;