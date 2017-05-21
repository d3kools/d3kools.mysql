
# d3kools.mysql

Sugar commands for mysql and mysqldump routines

@specific arguments could be appended with d3kmysql.cfg settings

Main user settings is 

## Commands
* mysql_d3dump_all
* mysql_d3dump_data
* mysql_d3dump_schema
* mysql_d3dump_solid
* mysql_d3info
* mysql_d3truncate
* mysql_d3restore

### mysql_d3info
usage: `mysql_d3info DATABASE`

```$TABLE (count(COLUMN_NAME)) : count(*) $TABLE```

### mysql_d3credentials
usage: `mysql_d3credentials`

show all users and their host/server/table entries

### mysql_d3truncate
truncate all tables in the database

usage: `mysql_d3truncate DATABASE`

### mysql_d3dump_solid
dump base in one sql file

usage: `mysql_d3dump_solid DATABASE`

output file : `db--solid.sql`

### mysql_d3dump_data
dump only data from specified table

usage: `mysql_d3dump_data DATABASE TABLE`

output file : `db__table--data.sql`

### mysql_d3dump_schema
dump only specified schema table

usage: `mysql_d3dump_schema DATABASE TABLE`

output file : `db__table--schema.sql`

### mysql_d3dump_all
dumps each table separately in common ./mysqldump_db folder

usage: `mysql_d3dump_all DATABASE`

output:

*./mysqldump_db/yyyymmdd-hhmmss/db__*table--data.sql*

*./mysqldump_db/yyyymmdd-hhmmss/db__*table--schema.sql*

sql files will be created automatically in new folder with timestamp name each time `mysqldump_db` runs

### mysql_d3restore

@todo:

### mysql_d3setsuffix
sets aliases for mysql and mysqldump:

`mysql --defaults-group-suffix=suffix`

`mysqldump --defaults-group-suffix=suffix`

*--defaults-group-suffix* allows to use multiply sections in the `~/.my.cnf` config file

suffix value is taken from environment variable *$mysql_group_suffix*

run:

```bash
$ export mysql_group_suffix=suffix;
$ eval `mysql_d3setsuffix`;
```

now your `~/.my.cnf` may be extended with

```ini
[clientsuffix]
...
[mysqlsuffix]
...
```

#### Chmod checkout
`chmod ug+x mysql_d3*``
