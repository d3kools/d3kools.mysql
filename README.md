
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
* mysql_d3info
* mysql_d3dump
* mysql_d3restore
* mysql_d3suffix

### mysql_d3info

`mysql_d3 info|credentials|check`

### mysql_d3info

usage: `mysql_d3info DATABASE`

```$TABLE (count(COLUMN_NAME)) : count(*) $TABLE```

#### mysql_d3info credentials

usage: `mysql_d3credentials`

show all users and their host/server/table entries

### mysql_d3dump

`mysql_d3dump solid|data|schema|all`

Supports autocompletion

#### mysql_d3dump solid

dump base in one *databasename--solid.sql* file

usage: `mysql_d3dump solid DATABASE`

output file : `db--solid.sql`

#### mysql_d3dump data

dump only data from specified table

usage: `mysql_d3dump data DATABASE TABLE`

output file : `db__table--data.sql`

#### mysql_d3dump schema

dump only specified schema table

usage: `mysql_d3dump schema DATABASE TABLE`

output file : `db__table--schema.sql`

#### mysql_d3dump all

dumps all tables separately in the *./mysqldump_db* folder

usage: `mysql_d3dump all DATABASE`

output:

*./mysqldump_DATABASE/yyyymmdd-hhmmss/db__*table--data.sql*

*./mysqldump_DATABASE/yyyymmdd-hhmmss/db__*table--schema.sql*

sql files will be created automatically in new folder with timestamp name each time `mysql_d3dump all` runs

### mysql_d3restore

executes `db__*--*.sql` files

#### mysql_d3restore solid

looks up for `DATABASE--solid.sql`

usage: `mysql_d3dump solid DATABASE`

#### mysql_d3restore data

looks up for `DATABASE__TABLE--data.sql` file

usage: `mysql_d3dump data DATABASE TABLE`

#### mysql_d3restore schema

looks up for `DATABASE__TABLE--schema.sql` file

usage: `mysql_d3dump schema DATABASE TABLE`

### mysql_d3suffix

#### mysql_d3suffix set

##### description

sets aliases for mysql and mysqldump:

`mysql --defaults-group-suffix=suffix`

`mysqldump --defaults-group-suffix=suffix`

*--defaults-group-suffix* allows to use multiply sections in the `~/.my.cnf` config file

suffix value is taken from environment variable *$mysql_group_suffix*

##### script variant

run:

```bash
$ export mysql_group_suffix=suffix
$ eval `mysql_d3suffix_set`
```

##### one line variant

```bash
$ mysql_d3suffix set suffix
```

##### .my.cnf

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

