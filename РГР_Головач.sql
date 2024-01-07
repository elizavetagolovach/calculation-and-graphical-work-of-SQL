-- Создание БД в mysql workbecnh
DROP DATABASE IF EXISTS Project_management;
CREATE DATABASE Project_management;
USE Project_management;
DROP TABLE IF EXISTS office_department, positions_at_work, project, employee_programs, employee;


    CREATE TABLE `office_department` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `office_name` VARCHAR(100) NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `employee` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `employee_name` VARCHAR(200) NOT NULL,
        `office_department_id` INT NOT NULL,
        `position_id` INT NOT NULL,
        `age` smallint NOT NULL,
        `male` bool NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `positions_at_work` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `position_name` VARCHAR(100) NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `project` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `project_title` VARCHAR(100) NOT NULL DEFAULT 'unknown_project',
        `project_description` TEXT NOT NULL,
        `project_date` DATE NOT NULL,
        `employee_id` INT NOT NULL,
        `office_department_id` INT NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `employee_programs` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `employee_id` INT NOT NULL,
        `program_name` VARCHAR(200) NOT NULL,
        `login` VARCHAR(100) NOT NULL DEFAULT 'LOGIN NOT SET',
        `password` VARCHAR(100) NOT NULL DEFAULT 'PASSWORD NOT SET',
        `access` bool NOT NULL DEFAULT false,
        PRIMARY KEY (`id`)
    );


    ALTER TABLE `employee` ADD CONSTRAINT `employee_fk0` FOREIGN KEY (`office_department_id`) REFERENCES `office_department`(`id`);

    ALTER TABLE `employee` ADD CONSTRAINT `employee_fk1` FOREIGN KEY (`position_id`) REFERENCES `positions_at_work`(`id`);

    ALTER TABLE `project` ADD CONSTRAINT `project_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`);

    ALTER TABLE `project` ADD CONSTRAINT `project_fk1` FOREIGN KEY (`office_department_id`) REFERENCES `employee`(`office_department_id`);

    ALTER TABLE `employee_programs` ADD CONSTRAINT `employee_programs_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`);


-- внесение данных
INSERT INTO office_department(office_name) 
VALUES	("Департамент планирования"),                   
        ("Коммерческий департамент"), 
        ("Департамент внедрения технологий"),                   
        ("Юридический департамент"), 
        ("Департамент проектирования информационных систем"),   
        ("Производственный департамент"), 
        ("Департамент эксплуатации"),                           
        ("Департамент денежного регулирования решений"), 
        ("Бухгатерский департамент"),              
        ("Внешнеэкономический департамент");

INSERT INTO positions_at_work(position_name) 
VALUES	("Куратор проекта"),                     
        ("Бизнес аналитик"), 
        ("Спонсор продукта"), 
        ("Владелец проекта "), 
        ("HR-менеджер"),        
        ("Аналитик"), 
        ("Бухгалтер"),                                    
        ("Разработчик"), 
        ("Художник"),              
        ("Системный аналитик");

INSERT INTO employee(office_department_id, position_id, employee_name, male, age)
VALUES 	(6, 1, "Ефимов Николай Михайлович", True, 40),
        (9, 2, "Карпова Дарья Александровна", True, 55),
        (2, 3, "Афанасьева Варвара Ивановна", True, 30),
        (3, 4, "Фетисова Карина Тимофеевна", True, 18),
        (8, 5, "Иванова Алина Мироновна", True, 20),
        (9, 6, "Никитин Роман Максимович", False, 25),
        (7, 7, "Лебедева Дарья Николаевна", False, 32),
        (6, 8, "Михайлова Виолетта Руслановна", False, 56),
        (9, 9, "Яковлев Владимир Артемьевич", False, 35),
        (4, 10, "Фролова Екатерина Александровна", False, 45);


INSERT INTO project(employee_id, office_department_id, project_date, project_title, project_description)
VALUES  (1, 2, "2018-12-23", "Разветвление рекламной политики", "Создания направления рекламы иностранных клиентов. Реклама  на зарубежных сайтах."),
        (1, 2, "2023-04-22", "Бесплатный курс интернет-безопасности", "Совместно с депортаментом сетевой безопасности создать бесплатный курс для наших клиентов по сетевой безопасности."),
        (1, 2, "2022-05-06", "Демо-версия ПО", "В целях привлечений новой аудитории рекомендуется создать демо-версию нашего антивируса."),
        (8, 6, "2023-12-19", "Акция 2 + 1", "При покупки нашего антивирусного ПО, предлагаем клеиенту систему по защите его платежей."),
        (3, 2, "2023-12-01", "Унификация антивируса", "Реализовать утилитную версию нашего антивируса для unix-подобных систем. Так же создать более тяжелую с GUI для тех же unix-систем."),
        (3, 2, "2021-11-15", "Анализатор спама", "Импортирование антивируса к почте, для устранения спама содержащего вирусные ссылки."),
        (3, 2, "2016-06-4", "Песочница в интеренете", "При переходе пользователя по фишинг или вредоносной ссылке, запускать браузер в виртуальном адресном пространстве, для обеспечения безопасности."),
        (8, 6, "2018-12-23", "Разветвление рекламной политики", "Создания направления рекламы иностранных клиентов. Реклама  на зарубежных сайтах."),
        (8, 6, "2023-07-22", "Подарки постоянным клиентам", "Клиенты, покупающие подписку на наш антивирус более 2-ух лет подряд получают месяц бесплатной подиски в подарок."),
        (8, 6, "2023-09-09", "Убрать рекламу из внутреннего приложения", "В антивирусном приложении нужно убрать рекламу в целях повышения его привлекательности. Оставить рекламу только на демо-версии.");

INSERT INTO employee_programs(employee_id, program_name, login, password, access)
VALUES  (1, "ERWIN data modeler", "Malwla-s", "mk123ijA@*1_", True),
        (1, "Microsoft Office Word", "-", "-", True),
        (1, "Figma Corp Edition", "Malwla-s", "mk123ijA@*1_", True),
        (3, "Django-admin", "adm_21lka@kl", "Y(*HDUAINd8o2ui1)ad2", False),
        (3, "Project-creator", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (3, "SQL-admin", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (3, "Skype Corp Edition", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (3, "FredOn Analys", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (8, "employee Base", "Keyajzmw23", "fsj73yhUdj12h:!@:L", True),
        (8, "VCK Company Account Editor", "Keyajzmw23", "fsj73yhUdj12h:!@:L", True);

-- ниже описаны триггеры для всех имеющихся связей
-- INSERT триггеры
DROP TRIGGER IF EXISTS project_insert;
DELIMITER //
CREATE TRIGGER project_insert BEFORE INSERT ON project
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.id) FROM employee WHERE employee.id = NEW.employee_id) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет возможности установить employee_id. Такого сотрудника не существует.';
END IF;
IF (NEW.office_department_id != (SELECT employee.office_department_id FROM employee WHERE employee.id = NEW.employee_id)) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Этот сотрудник не принадлежит к office_department.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employee_insert;
DELIMITER //
CREATE TRIGGER employee_insert BEFORE INSERT ON employee
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(office_department.id) FROM office_department WHERE office_department.id = NEW.office_department_id) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого office_department_id.';
END IF;
IF ((SELECT COUNT(positions_at_work.id) FROM positions_at_work WHERE positions_at_work.id = NEW.position_id) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого position_id.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employee_programs_insert;
DELIMITER //
CREATE TRIGGER employee_programs_insert BEFORE INSERT ON employee_programs
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.id) FROM employee WHERE employee.id = NEW.employee_id) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Не такого employee_id.';
END IF;
END //
DELIMITER ;

-- UPDATE триггеры
DROP TRIGGER IF EXISTS project_update;
DELIMITER //
CREATE TRIGGER project_update BEFORE UPDATE ON project
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.id) FROM employee WHERE employee.id = NEW.employee_id) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет возможности обновить employee_id. Такого сотрудника не существует.';
END IF;

IF (NEW.office_department_id != (SELECT employee.office_department_id FROM employee WHERE employee.id = NEW.employee_id)) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Этот сотрудник не принадлежит к office_department.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employee_update;
DELIMITER //
CREATE TRIGGER employee_update BEFORE UPDATE ON employee
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(office_department.id) FROM office_department WHERE office_department.id = NEW.office_department_id) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого office_department_id.';
END IF;
IF ((SELECT COUNT(positions_at_work.id) FROM positions_at_work WHERE positions_at_work.id = NEW.position_id) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого position_id.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employee_programs_update;
DELIMITER //
CREATE TRIGGER employee_programs_update BEFORE UPDATE ON employee_programs
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.id) FROM employee WHERE employee.id = NEW.employee_id) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого employee_id.';
END IF;
END //
DELIMITER ;

-- DELETE триггеры
DROP TRIGGER IF EXISTS employee_programs_update;
DELIMITER //
CREATE TRIGGER employee_delete BEFORE DELETE ON employee
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee_programs.employee_id) FROM employee_programs WHERE employee_programs.employee_id = OLD.id) != 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Вы не можете удалить этого сотрудника. Потому что он находится в таблице employee_programs. Удалите его из таблицы employee_programs сначала.';
END IF;
IF ((SELECT COUNT(project.employee_id) FROM project WHERE project.employee_id = OLD.id) != 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Вы не можете удалить этого сотрудника. Потому что он находится в таблице project. Удалите его из таблицы project сначала.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS office_department_delete;
DELIMITER //
CREATE TRIGGER office_department_delete BEFORE DELETE ON office_department
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.office_department_id) FROM employee WHERE employee.office_department_id = OLD.id) != 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Вы не можете удалить этот office_department. Потому что в нем находя некоторые сотрудники.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS positions_at_work_delete;
DELIMITER //
CREATE TRIGGER positions_at_work_delete BEFORE DELETE ON positions_at_work
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.position_id) FROM employee WHERE employee.position_id = OLD.id) != 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Вы не можете удалить эту должность. Потому что некторые сотрудники находятся в ней';
END IF;
END //
DELIMITER ;
