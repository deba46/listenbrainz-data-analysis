import psycopg2

def get_db_connection(db_config):
    try:
        return psycopg2.connect(**db_config)
    except Exception as e:
        print(f"Error connecting to DB: {e}")
        raise

def execute_sql_script(conn, sql_script):
    try:
        with conn.cursor() as cursor:
            cursor.execute(sql_script)
        conn.commit()
    except Exception as e:
        conn.rollback()
        print(f"Error executing SQL script: {e}")
        raise

def run_dml_from_file(conn, filepath, **params):
    """ USe this function to run non-select queries"""
    try:
        with open(filepath, 'r') as f:
            sql = f.read()
        if params:
            sql = sql.format(**params)
        execute_sql_script(conn, sql)
    except Exception as e:
        print(f"Error running SQL from file {filepath}: {e}")
        raise
