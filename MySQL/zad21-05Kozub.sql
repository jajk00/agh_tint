CREATE DATABASE IF NOT EXISTS baza;
USE baza;

# Zadanie 1

CREATE TABLE IF NOT EXISTS dane (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Imie VARCHAR(20) NOT NULL,
	Nazwisko VARCHAR(30) NOT NULL,
    Data_urodzenia DATE,
	Miejscowosc VARCHAR(20),
	Znam_od DATE,
	Plec CHAR(1) NOT NULL
);

# Zadanie 2

DESCRIBE dane;

# Zadanie 4

SELECT * FROM dane;

# Zadanie 5

INSERT INTO dane (Imie, Nazwisko, Data_urodzenia, Miejscowosc, Znam_od, Plec)
VALUES
('Janina','Palczyńska','1983-07-11','Kraków','2000-09-13','K'),
('Jan','Kłos','1988-09-12','Wrocław','2000-04-17','M'),
('Zofia','Nowak','1982-01-03','Warszawa','2008-06-13','K'),
('Jolanta','Świderska','1987-10-09','Szczecin','2010-08-13','K'),
('Michał','Abramowicz','1976-09-12','Kraków','2001-09-09','M'),
('Anna','Nowina','1984-05-12','Nowy targ','2007-05-11','K'),
('Jan','Kołakowski','1986-09-19','Łódź','2010-01-13','M');

# Zadanie 6

SELECT * FROM dane
WHERE SUBSTRING(Nazwisko, 1, 1) = 'K'
ORDER BY Nazwisko DESC;

SELECT * FROM dane
WHERE Plec = 'K'
LIMIT 1;

SELECT * FROM dane
WHERE Data_urodzenia < '1999-12-12'
ORDER BY Data_urodzenia DESC;

SELECT *, COUNT(Imie) c FROM dane
WHERE SUBSTRING(Imie, 1, 1) = 'J'
GROUP BY Imie
HAVING c = 1;

SELECT * FROM dane
WHERE Plec = 'K' AND SUBSTRING(Miejscowosc, 1, 1) = 'S';

SELECT Imie, Nazwisko, Data_urodzenia, FLOOR(DATEDIFF(CURDATE(), Data_urodzenia)/365.25) Wiek FROM dane;

# Zadanie 7

UPDATE dane
SET Miejscowosc = 'Warszawa-Mokotów'
WHERE Miejscowosc = 'Warszawa';

UPDATE dane
SET Plec = IF(Plec = 'M', 'K', 'M');

UPDATE dane
SET Data_urodzenia = DATE_ADD(Data_urodzenia, INTERVAL 1 YEAR)
WHERE Plec = 'K';

# Zadanie 8

DELETE FROM dane
WHERE Nazwisko LIKE '%ab%';

DELETE FROM dane
WHERE Plec = 'K';

DELETE FROM dane
WHERE Data_urodzenia > '1987-12-31'

# Zadanie 9

DELETE FROM dane;

# Zadanie 10

DROP TABLE dane;