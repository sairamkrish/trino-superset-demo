-- Need to manually run each query now.

CREATE SCHEMA IF NOT EXISTS hive.iris
WITH (location = 's3a://iris/');

-- Path s3a://iris/iris_data is the holding directory. We dont give full file path. Only parent directory
CREATE TABLE IF NOT EXISTS hive.iris.iris_data (
  sepal_length DOUBLE,
  sepal_width  DOUBLE,
  petal_length DOUBLE,
  petal_width  DOUBLE,
  class        VARCHAR
)
WITH (
  external_location = 's3a://iris/iris_data',
  format = 'PARQUET'
);

-- Testing
SELECT 
  sepal_length,
  class
FROM hive.iris.iris_data
LIMIT 10;

SHOW TABLES IN hive.iris;