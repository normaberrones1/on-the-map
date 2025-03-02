-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER travellog_owner
WITH PASSWORD 'travellog';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO travellog_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO travellog_owner;

CREATE USER travellog_appuser
WITH PASSWORD 'travellog';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO travellog_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO travellog_appuser;
