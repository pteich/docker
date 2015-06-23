To run execute:

```sh

docker run -d --name=mariadb -v <data-dir>:/data:rw pteich/mariadb
```

To publicly expose Mysql's port 3306 add `-p 3306:3306` to the command above.

Possible environment variables:

`MARIADB_USER` admin user name, defaults to `docker`  
`MARIADB_PASS` admin user password

If you don't provide a password it will be generated at first run. Wait a moment for the first start and execute `docker logs mariadb`. Username and password are shown in there logs.

This container will check on every start if the mounted data folder contains initialized data. If not it will create it. You can check this in the generated logs.