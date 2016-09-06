# db-schema

SQL schema generation tool.

# Example

```
var dbs = new DBSchema()

var yamlSource = fs.readFileSync('./schema.yaml')

var sql = dbs.generateSchemaFromYaml('mysql',yamlSource)
```

# YAML source

Following yaml:

```
Department:
  columns:
    name:
      type: string
      default: test
    code: string
  relations:
    employees:
      entity: Employee
      toMany: true
      inverse: department

Employee:
  columns:
    firstname: string
    surname: string
  relations:
    department:
      entity: Department
      inverse: employees
    collegues:
      entity: Employee
      toMany: true
      inverse: collegues
  indexes:
    name:
      columns:
        - firstname
        - surname
```

Will generate SQL:
```
CREATE TABLE IF NOT EXISTS `department` (`id` int(11) NOT NULL AUTO_INCREMENT,PRIMARY KEY (`id`),`name` varchar(255) NULL DEFAULT 'test',`code` varchar(255) NULL DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `employee` (`id` int(11) NOT NULL AUTO_INCREMENT,PRIMARY KEY (`id`),`firstname` varchar(255) NULL DEFAULT NULL,`surname` varchar(255) NULL DEFAULT NULL,`department_id` int(11) NULL DEFAULT NULL,KEY `department_id` (`department_id`),KEY `name` (`firstname`,`surname`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `employee_collegues` (`employee_id` int(11) NOT NULL,`collegue_id` int(11) NOT NULL, PRIMARY KEY (`employee_id`,`collegue_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```