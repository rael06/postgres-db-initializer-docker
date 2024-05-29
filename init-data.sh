#!/bin/sh
set -e;

if [ -n "${DATABASE_USERNAME:-}" ] && [ -n "${DATABASE_PASSWORD:-}" ]; 
then
	psql -v ON_ERROR_STOP=1 postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@postgres:5432/$POSTGRES_DB <<-EOSQL
		CREATE DATABASE "${DATABASE_NAME}";
		
		-- Create user only if it doesn't exist
		DO \$\$
		BEGIN
			IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = '${DATABASE_USERNAME}') THEN
				CREATE USER ${DATABASE_USERNAME} WITH PASSWORD '${DATABASE_PASSWORD}';
			END IF;
		END
		\$\$;
		
		GRANT ALL PRIVILEGES ON DATABASE "${DATABASE_NAME}" TO "${DATABASE_USERNAME}";
	EOSQL
else
	echo "SETUP INFO: No Environment variables given!"
fi

exit 0;
