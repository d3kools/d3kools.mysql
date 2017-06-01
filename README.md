
# d3kools.mysql

Sugar commands for mysql and mysqldump routines.

Simple workout with single database.
No user, server and password parametres.
Such parametres as server, database, user, password have to be specified via suffix sintax.

## Installation

### Github clone installation
```bash
git clone https://github.com/d3kools/d3kools.mysql.git
cd d3kools.mysql
sudo ./install.sh
```
### Remote installation
```bash
wget -qO- https://raw.githubusercontent.com/d3kools/d3kools.mysql/master/install.sh | bash
```

### Configuration

#### mysql suffix

Add database, user, password (and server if needs) in your `~/.my.cnf` to new sections with *xmpl* suffix : [client**xmpl**] and [mysql**xmpl**]

```ini
[client]
...
[mysql]
...
[clientxmpl]
...
[mysqlxmpl]
...
```

and activate *xmpl* with:
```bash
export mysql_group_suffix=xmpl
eval `mysql_d3suffix_set`
```

this appends two aliases: *mysql* & *mysqldump* with [defaults-group-suffix] (https://dev.mysql.com/doc/refman/5.7/en/option-file-options.html#option_general_defaults-group-suffix) option

#### d3 settings
**mysql_d3** settings file : `~/.mysql_d3.rc`


## Commands
* mysql_d3
* mysql_d3dump
* mysql_d3dump_all
* mysql_d3dump_data
* mysql_d3dump_schema
* mysql_d3dump_solid
* mysql_d3info
* mysql_d3credentials
* mysql_d3truncate
* mysql_d3restore
* mysql_d3suffix_set

### mysql_d3info

`mysql_d3 info|credentials|check`

### mysql_d3info
usage: `mysql_d3info DATABASE`

alias for `mysql_d3 info`

```$TABLE (count(COLUMN_NAME)) : count(*) $TABLE```

### mysql_d3credentials
usage: `mysql_d3credentials`

alias for `mysql_d3 credentials`

show all users and their host/server/table entries

### mysql_d3truncate
truncate all tables in the database

usage: `mysql_d3truncate DATABASE`

### mysql_d3dump

`mysql_d3dump solid|data|schema|all`

Aggregator for:

- mysql_d3dump_solid
- mysql_d3dump_data
- mysql_d3dump_schema
- mysql_d3dump_all

Supports autocompletion

### mysql_d3dump_solid
dump base in one *databasename--solid.sql* file

alias for `mysql_d3dump solid`

usage: `mysql_d3dump_solid DATABASE`

output file : `db--solid.sql`

### mysql_d3dump_data
dump only data from specified table

alias for `mysql_d3dump schema`

usage: `mysql_d3dump_data DATABASE TABLE`

output file : `db__table--data.sql`

### mysql_d3dump_schema
dump only specified schema table

alias for `mysql_d3dump schema`

usage: `mysql_d3dump_schema DATABASE TABLE`

output file : `db__table--schema.sql`

### mysql_d3dump_all
dumps all tables separately in the *./mysqldump_db* folder

alias for `mysql_d3dump all`

usage: `mysql_d3dump_all DATABASE`

output:

*./mysqldump_db/yyyymmdd-hhmmss/db__*table--data.sql*

*./mysqldump_db/yyyymmdd-hhmmss/db__*table--schema.sql*

sql files will be created automatically in new folder with timestamp name each time `mysql_d3dump_all` runs

### mysql_d3restore

executes `db__*--*.sql` files

### mysql_d3suffix_set
#### description
sets aliases for mysql and mysqldump:

`mysql --defaults-group-suffix=suffix`

`mysqldump --defaults-group-suffix=suffix`

*--defaults-group-suffix* allows to use multiply sections in the `~/.my.cnf` config file

suffix value is taken from environment variable *$mysql_group_suffix*

#### script variant
run:

```bash
$ export mysql_group_suffix=suffix
$ eval `mysql_d3suffix_set`
```

#### one line variant
```bash
$ mysql_d3suffix set suffix
```

#### .my.cnf
now your `~/.my.cnf` may be extended with

```ini
[clientsuffix]
...
[mysqlsuffix]
...


```

### Stuff

#### Chmod checkout
`chmod 775 mysql_d3*`

#### todo

Specific arguments could be appended with ~/.mysql_d3.rc settings.

Main user settings is arguments,suffix

