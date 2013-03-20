\! echo "Dropping and creating database..."

DROP DATABASE beelog;
CREATE DATABASE beelog;

use beelog;
\! echo "Creating tables..."
\! echo "...Hive Components"

CREATE TABLE hive_components (
       id             INT,
       component_type INT,
       start_date     DATE,         \! First used date
       end_date       DATE,         \! Date taken out of service
       colony         INT,          \! Colony currently using this part
       source         TEXT,         \! Source
       comment        TEXT
) engine = innodb;

CREATE TABLE component_type (
       id    INT,
       name  CHAR(50),              \! Short name
       description TEXT,            \! Component description
) engine = innodb;

CREATE TABLE colony (
       id    INT,
       name  CHAR(50),
       description      TEXT,
       comment          TEXT
) engine = innodb;

CREATE TABLE queen (
       id    INT,
       name  CHAR(50),
       mother   INT,
       emerge_date DATE,           \! Date emerged (roughly!)
       colony      INT,
       description TEXT,           \! general information about queen
       comment     TEXT
) engine = innodb;

\! TODO: (1) History log for hive components. When parts are added to or
\!           removed from the hive.
\! TODO: (2) Add relational rules to table declarations
