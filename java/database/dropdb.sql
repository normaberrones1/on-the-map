-- **************************************************************
-- This script destroys the database and associated users
-- **************************************************************

-- The following line terminates any active connections to the database so that it can be destroyed
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'travellog';

DROP DATABASE travel-log;

DROP USER travellog_owner;
DROP USER travellog_appuser;
