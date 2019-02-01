# Database for elections in DB2

Homework for Bases de datos avanzadas in the Tecnológico de Monterrey CSF with the professor Vicente Cubells Nonell

## Prerequisites

- Install docker in ubuntu
- Download the image of db2express

## Installation

Run the docker container with the following command

```bash
sudo docker run -it -p 50000:50000 -eDB2INST1_PASSWORD=db2inst1-pwd -e LICENSE=accept ibmcom/db2express-c:latest bash
```
Create an instance to log in db2

```bash
sudo su - db2inst1
```
After the creation of the instance log in db2

```bash
db2
```

## Usage

Execute the scripts in the following order:

* Tarea1-db2.sql
* Tarea1-db2-fill.sql
* Tarea1-db2-querys.sql

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
By
* [Joan Andoni](https://github.com/JoanAndoni)
* [Alejandra Tubilla](https://github.com/alejandratub)
