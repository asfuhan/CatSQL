SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT singer.name , singer.country , singer.age FROM singer ORDER BY singer.age DESC
SELECT singer.name , singer.country , singer.age FROM singer ORDER BY singer.age DESC
SELECT avg(singer.age) , min(singer.age) , max(singer.age) FROM singer WHERE singer.country = "France"
SELECT avg(singer.age) , min(singer.age) , max(singer.age) FROM singer WHERE singer.country = "France"
SELECT singer.song_name , singer.song_release_year FROM singer ORDER BY singer.age ASC LIMIT 1
SELECT singer.song_name , singer.song_release_year FROM singer ORDER BY singer.age ASC LIMIT 1
SELECT DISTINCT singer.country FROM singer WHERE singer.age > 20
SELECT DISTINCT singer.country FROM singer WHERE singer.age > 20
SELECT singer.country , count(*) FROM singer GROUP BY singer.country
SELECT singer.country , count(*) FROM singer GROUP BY singer.country
SELECT singer.song_name FROM singer WHERE singer.age > ( SELECT avg(singer.age) FROM singer )
SELECT singer.song_name FROM singer WHERE singer.age > ( SELECT avg(singer.age) FROM singer )
SELECT stadium.location , stadium.name FROM stadium WHERE stadium.capacity between 5000 AND 10000
SELECT stadium.location , stadium.name FROM stadium WHERE stadium.capacity between 5000 AND 10000
SELECT max(stadium.capacity) , avg(stadium.capacity) FROM stadium
SELECT avg(stadium.capacity) , max(stadium.capacity) FROM stadium
SELECT stadium.name , stadium.capacity FROM stadium ORDER BY stadium.average DESC LIMIT 1
SELECT stadium.name , stadium.capacity FROM stadium ORDER BY stadium.average DESC LIMIT 1
SELECT count(*) FROM concert WHERE concert.year = 2014 OR concert.year = 2015
SELECT count(*) FROM concert WHERE concert.year = 2014 OR concert.year = 2015
SELECT stadium.name , count(*) FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id GROUP BY concert.stadium_id
SELECT stadium.stadium_id , count(*) FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id GROUP BY stadium.stadium_id
SELECT stadium.name , stadium.capacity FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE concert.year >= 2014 GROUP BY concert.stadium_id ORDER BY count(*) DESC LIMIT 1
SELECT stadium.name , stadium.capacity FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE concert.year > 2013 GROUP BY concert.stadium_id ORDER BY count(*) DESC LIMIT 1
SELECT concert.year FROM concert GROUP BY concert.year ORDER BY count(*) DESC LIMIT 1
SELECT concert.year FROM concert GROUP BY concert.year ORDER BY count(*) DESC LIMIT 1
SELECT stadium.name FROM stadium WHERE stadium.stadium_id not in ( SELECT concert.stadium_id FROM concert )
SELECT stadium.name FROM stadium WHERE stadium.stadium_id not in ( SELECT concert.stadium_id FROM concert )
SELECT singer.country FROM singer WHERE singer.age > 40 INTERSECT SELECT singer.country FROM singer WHERE singer.age < 30
SELECT stadium.name FROM stadium EXCEPT SELECT stadium.name FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE concert.year = 2014
SELECT stadium.name FROM stadium EXCEPT SELECT stadium.name FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE concert.year = 2014
SELECT concert.concert_name , concert.theme , count(*) FROM singer_in_concert JOIN concert ON singer_in_concert.concert_id = concert.concert_id GROUP BY concert.concert_id
SELECT concert.concert_name , concert.theme , count(*) FROM singer_in_concert JOIN concert ON singer_in_concert.concert_id = concert.concert_id GROUP BY concert.concert_id
SELECT singer.name , count(*) FROM singer_in_concert JOIN singer ON singer_in_concert.singer_id = singer.singer_id GROUP BY singer.singer_id
SELECT singer.name , count(*) FROM singer_in_concert JOIN singer ON singer_in_concert.singer_id = singer.singer_id GROUP BY singer.singer_id
SELECT singer.name FROM singer_in_concert JOIN concert ON singer_in_concert.concert_id = concert.concert_id JOIN singer ON singer_in_concert.singer_id = singer.singer_id WHERE concert.year = 2014
SELECT singer.name FROM singer_in_concert JOIN concert ON singer_in_concert.concert_id = concert.concert_id JOIN singer ON singer_in_concert.singer_id = singer.singer_id WHERE concert.year = 2014
SELECT singer.name , singer.country FROM singer WHERE singer.song_name like "%hey%"
SELECT singer.name , singer.country FROM singer WHERE singer.song_name like "%hey%"
SELECT stadium.name , stadium.location FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE concert.year = 2014 INTERSECT SELECT stadium.name , stadium.location FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE concert.year = 2015
SELECT stadium.name , stadium.location FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE concert.year = 2014 INTERSECT SELECT stadium.name , stadium.location FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE concert.year = 2015
SELECT count(*) FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE stadium.capacity = (SELECT stadium.capacity FROM stadium ORDER BY stadium.capacity DESC LIMIT 1)
SELECT count(*) FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE stadium.capacity = (SELECT stadium.capacity FROM stadium ORDER BY stadium.capacity DESC LIMIT 1)
SELECT count(*) FROM pets WHERE pets.weight > 10
SELECT count(*) FROM pets WHERE pets.weight > 10
SELECT pets.weight FROM pets ORDER BY pets.pet_age ASC LIMIT 1
SELECT pets.weight FROM pets ORDER BY pets.pet_age ASC LIMIT 1
SELECT max(pets.weight) , pets.pettype FROM pets GROUP BY pets.pettype
SELECT max(pets.weight) , pets.pettype FROM pets GROUP BY pets.pettype
SELECT count(*) FROM student JOIN has_pet ON student.stuid = has_pet.stuid WHERE student.age > 20
SELECT count(*) FROM student JOIN has_pet ON student.stuid = has_pet.stuid WHERE student.age > 20
SELECT count(*) FROM has_pet JOIN student ON has_pet.stuid = student.stuid WHERE student.sex = "F"
SELECT count(*) FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE student.sex = "F" AND pets.pettype = "dog"
SELECT count(DISTINCT pets.pettype) FROM pets
SELECT count(DISTINCT pets.pettype) FROM pets
SELECT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat" OR pets.pettype = "dog"
SELECT DISTINCT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat" OR pets.pettype = "dog"
SELECT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat" INTERSECT SELECT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "dog"
SELECT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat" INTERSECT SELECT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "dog"
SELECT student.major , student.age FROM student WHERE student.stuid not in ( SELECT has_pet.stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat" )
SELECT student.major , student.age FROM student WHERE student.stuid not in ( SELECT has_pet.stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat" )
SELECT student.stuid FROM student EXCEPT SELECT has_pet.stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat"
SELECT student.stuid FROM student EXCEPT SELECT has_pet.stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat"
SELECT student.fname , student.age FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "dog" EXCEPT SELECT student.fname , student.age FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat"
SELECT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "dog" EXCEPT SELECT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = "cat"
SELECT pets.pettype , pets.weight FROM pets ORDER BY pets.pet_age ASC LIMIT 1
SELECT pets.pettype , pets.weight FROM pets ORDER BY pets.pet_age ASC LIMIT 1
SELECT pets.petid , pets.weight FROM pets WHERE pets.pet_age > 1
SELECT pets.petid , pets.weight FROM pets WHERE pets.pet_age > 1
SELECT avg(pets.pet_age) , max(pets.pet_age) , pets.pettype FROM pets GROUP BY pets.pettype
SELECT avg(pets.pet_age) , max(pets.pet_age) , pets.pettype FROM pets GROUP BY pets.pettype
SELECT avg(pets.weight) , pets.pettype FROM pets GROUP BY pets.pettype
SELECT avg(pets.weight) , pets.pettype FROM pets GROUP BY pets.pettype
SELECT DISTINCT student.fname , student.age FROM student JOIN has_pet ON student.stuid = has_pet.stuid
SELECT DISTINCT student.fname , student.age FROM student JOIN has_pet ON student.stuid = has_pet.stuid
SELECT has_pet.petid FROM student JOIN has_pet ON student.stuid = has_pet.stuid WHERE student.lname = "Smith"
SELECT has_pet.petid FROM student JOIN has_pet ON student.stuid = has_pet.stuid WHERE student.lname = "Smith"
SELECT count(*) , has_pet.stuid FROM has_pet GROUP BY has_pet.stuid
SELECT count(*) , student.stuid FROM student JOIN has_pet ON student.stuid = has_pet.stuid GROUP BY student.stuid
SELECT student.fname , student.sex FROM student JOIN has_pet ON student.stuid = has_pet.stuid GROUP BY has_pet.stuid HAVING count(*) > 1
SELECT student.fname , student.sex FROM student JOIN has_pet ON student.stuid = has_pet.stuid GROUP BY has_pet.stuid HAVING count(*) > 1
SELECT student.lname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pet_age = 3 AND pets.pettype = "cat"
SELECT student.lname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pet_age = 3 AND pets.pettype = "cat"
SELECT avg(student.age) FROM student WHERE student.stuid not in ( SELECT has_pet.stuid FROM has_pet )
SELECT avg(student.age) FROM student WHERE student.stuid not in ( SELECT has_pet.stuid FROM has_pet )
SELECT count(*) FROM continents
SELECT count(*) FROM continents
SELECT count(*) , continents.continent FROM countries JOIN continents ON countries.continent = continents.contid GROUP BY continents.continent
SELECT countries.continent , countries.countryname , count(*) FROM countries GROUP BY countries.countryid
SELECT count(*) FROM countries
SELECT count(*) FROM countries
SELECT car_makers.fullname , count(*) , car_makers.id FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id
SELECT car_makers.fullname , count(*) , car_makers.id FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id
SELECT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model ORDER BY cars_data.horsepower ASC LIMIT 1
SELECT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model ORDER BY cars_data.horsepower ASC LIMIT 1
SELECT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE cars_data.weight < ( SELECT avg(cars_data.weight) FROM cars_data )
SELECT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE cars_data.weight < ( SELECT avg(cars_data.weight) FROM cars_data )
SELECT car_makers.maker FROM car_makers JOIN model_list ON car_makers.id = model_list.maker JOIN car_names ON model_list.model = car_names.model JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.year = 1970
SELECT DISTINCT car_makers.maker FROM car_makers JOIN model_list ON car_makers.id = model_list.maker JOIN car_names ON model_list.model = car_names.model JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.year = 1970
SELECT car_names.make , cars_data.weight FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid ORDER BY cars_data.year ASC LIMIT 1
SELECT car_makers.maker , cars_data.year FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model JOIN car_makers ON model_list.maker = car_makers.id ORDER BY cars_data.year ASC LIMIT 1
SELECT DISTINCT car_names.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cars_data.year > 1980
SELECT DISTINCT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE cars_data.year > 1980
SELECT continents.continent , count(*) FROM car_makers JOIN countries ON car_makers.country = countries.countryid JOIN continents ON countries.continent = continents.contid GROUP BY continents.continent
SELECT continents.continent , count(*) FROM continents JOIN countries ON continents.contid = countries.continent JOIN car_makers ON countries.countryid = car_makers.country GROUP BY continents.continent
SELECT countries.countryname FROM car_makers JOIN countries ON car_makers.country = countries.countryid GROUP BY car_makers.country ORDER BY count(*) DESC LIMIT 1
SELECT countries.countryname FROM car_makers JOIN countries ON car_makers.country = countries.countryid GROUP BY countries.countryname ORDER BY count(*) DESC LIMIT 1
SELECT count(*) , car_makers.fullname FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.fullname
SELECT count(*) , car_makers.id FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id
SELECT cars_data.accelerate FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE car_names.make = "amc hornet sportabout (sw)"
SELECT cars_data.accelerate FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE car_names.make = "amc hornet sportabout (sw)"
SELECT count(*) FROM car_makers JOIN countries ON car_makers.country = countries.countryid WHERE countries.countryname = "france"
SELECT count(*) FROM car_makers JOIN countries ON car_makers.country = countries.countryid WHERE countries.countryname = "france"
SELECT count(*) FROM model_list JOIN car_makers ON model_list.maker = car_makers.id JOIN countries ON car_makers.country = countries.countryid WHERE countries.countryname = "usa"
SELECT count(*) FROM countries JOIN car_makers ON countries.countryid = car_makers.country JOIN model_list ON car_makers.id = model_list.maker WHERE countries.countryname = "usa"
SELECT avg(cars_data.mpg) FROM cars_data WHERE cars_data.cylinders = 4
SELECT avg(cars_data.mpg) FROM cars_data WHERE cars_data.cylinders = 4
SELECT min(cars_data.weight) FROM cars_data WHERE cars_data.year = 1974 AND cars_data.cylinders = 8
SELECT min(cars_data.weight) FROM cars_data WHERE cars_data.year = 1974 AND cars_data.cylinders = 8
SELECT car_makers.maker , model_list.maker FROM car_makers JOIN model_list ON car_makers.id = model_list.maker
SELECT car_makers.maker , model_list.maker FROM model_list JOIN car_makers ON model_list.maker = car_makers.id
SELECT countries.countryname , countries.countryid FROM countries JOIN car_makers ON countries.countryid = car_makers.country
SELECT countries.countryname , countries.countryid FROM countries JOIN car_makers ON countries.countryid = car_makers.country GROUP BY countries.countryid HAVING count(*) >= 1
SELECT count(*) FROM cars_data WHERE cars_data.horsepower > 150
SELECT count(*) FROM cars_data WHERE cars_data.horsepower > 150
SELECT avg(cars_data.weight) , cars_data.year FROM cars_data GROUP BY cars_data.year
SELECT avg(cars_data.weight) , cars_data.year FROM cars_data GROUP BY cars_data.year
SELECT countries.countryname FROM continents JOIN countries ON continents.contid = countries.continent WHERE continents.continent = "europe" GROUP BY countries.countryname HAVING count(*) >= 3
SELECT countries.countryname FROM continents JOIN countries ON continents.contid = countries.continent WHERE continents.continent = "europe" GROUP BY countries.countryname HAVING count(*) >= 3
SELECT cars_data.horsepower , car_names.make FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cars_data.cylinders = 3 ORDER BY cars_data.horsepower DESC LIMIT 1
SELECT cars_data.horsepower , model_list.maker FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE cars_data.cylinders = 3 ORDER BY cars_data.horsepower DESC LIMIT 1
SELECT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model ORDER BY cars_data.mpg DESC LIMIT 1
SELECT car_names.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid ORDER BY cars_data.mpg DESC LIMIT 1
SELECT avg(cars_data.horsepower) FROM cars_data WHERE cars_data.year < 1980
SELECT avg(cars_data.horsepower) FROM cars_data WHERE cars_data.year < 1980
SELECT avg(cars_data.edispl) FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id WHERE car_names.model = "volvo"
SELECT avg(cars_data.edispl) FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id WHERE car_names.model = "volvo"
SELECT max(cars_data.accelerate) , cars_data.cylinders FROM cars_data GROUP BY cars_data.cylinders
SELECT max(cars_data.accelerate) , cars_data.cylinders FROM cars_data GROUP BY cars_data.cylinders
SELECT model_list.model FROM car_names JOIN model_list ON car_names.model = model_list.model GROUP BY model_list.modelid ORDER BY count(*) DESC LIMIT 1
SELECT model_list.model FROM model_list GROUP BY model_list.model ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM cars_data WHERE cars_data.cylinders > 4
SELECT count(*) FROM cars_data WHERE cars_data.cylinders > 4
SELECT count(*) FROM cars_data WHERE cars_data.year = 1980
SELECT count(*) FROM cars_data WHERE cars_data.year = 1980
SELECT count(*) FROM car_makers JOIN model_list ON car_makers.id = model_list.maker WHERE car_makers.fullname = "American Motor Company"
SELECT count(*) FROM car_makers JOIN model_list ON car_makers.id = model_list.maker WHERE car_makers.fullname = "American Motor Company"
SELECT car_makers.fullname , car_makers.id FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id HAVING count(*) > 3
SELECT car_makers.fullname , car_makers.id FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id HAVING count(*) > 3
SELECT DISTINCT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model JOIN car_makers ON model_list.maker = car_makers.id WHERE car_makers.fullname = "General Motors" OR cars_data.weight > 3500
SELECT DISTINCT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model JOIN car_makers ON model_list.maker = car_makers.id WHERE car_makers.fullname = "General Motors" OR cars_data.weight > 3500
SELECT cars_data.year FROM cars_data WHERE cars_data.weight <= 3000
SELECT cars_data.year FROM cars_data WHERE cars_data.weight < 4000 INTERSECT SELECT cars_data.year FROM cars_data WHERE cars_data.weight > 3000
SELECT cars_data.horsepower FROM cars_data ORDER BY cars_data.accelerate DESC LIMIT 1
SELECT cars_data.horsepower FROM cars_data ORDER BY cars_data.accelerate DESC LIMIT 1
SELECT cars_data.cylinders FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE car_names.model = "volvo" ORDER BY cars_data.accelerate ASC LIMIT 1
SELECT cars_data.cylinders FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE car_names.model = "volvo" ORDER BY cars_data.accelerate ASC LIMIT 1
SELECT count(*) FROM cars_data WHERE cars_data.accelerate > ( SELECT max(cars_data.accelerate) FROM cars_data )
SELECT count(*) FROM cars_data WHERE cars_data.accelerate > ( SELECT cars_data.accelerate FROM cars_data ORDER BY cars_data.horsepower DESC LIMIT 1 )
SELECT count(*) FROM ( SELECT car_makers.country FROM car_makers GROUP BY car_makers.country HAVING count(*) > 2 )
SELECT count(*) FROM ( SELECT countries.countryname FROM countries JOIN car_makers ON countries.countryid = car_makers.country GROUP BY countries.countryname HAVING count(*) > 2 )
SELECT count(*) FROM cars_data WHERE cars_data.cylinders > 6
SELECT count(*) FROM cars_data WHERE cars_data.cylinders > 6
SELECT car_names.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cars_data.cylinders = 4 ORDER BY cars_data.horsepower DESC LIMIT 1
SELECT car_names.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cars_data.cylinders = 4 ORDER BY cars_data.horsepower DESC LIMIT 1
SELECT car_names.makeid , car_makers.maker FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model JOIN car_makers ON model_list.maker = car_makers.id WHERE cars_data.horsepower < ( SELECT min(cars_data.horsepower) FROM cars_data )
SELECT car_names.makeid , car_names.make FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cars_data.horsepower < ( SELECT min(cars_data.horsepower) FROM cars_data )
SELECT max(cars_data.mpg) FROM cars_data WHERE cars_data.cylinders = 8 OR cars_data.year < 1980
SELECT max(cars_data.mpg) FROM cars_data WHERE cars_data.cylinders = 8 OR cars_data.year < 1980
SELECT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE cars_data.weight < 3500 EXCEPT SELECT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model JOIN car_makers ON model_list.maker = car_makers.id WHERE car_makers.fullname = "Ford Motor Company"
SELECT DISTINCT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE cars_data.weight < 3500 EXCEPT SELECT model_list.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE car_makers.fullname = "Ford Motor Company"
SELECT countries.countryname FROM countries WHERE countries.countryid not in ( SELECT car_makers.country FROM car_makers )
SELECT countries.countryname FROM countries WHERE countries.countryid not in ( SELECT car_makers.country FROM car_makers )
SELECT car_makers.id , car_makers.maker FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id HAVING count(*) >= 2 INTERSECT SELECT car_makers.id , car_makers.maker FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id HAVING count(*) > 3
SELECT car_makers.id , car_makers.maker FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id HAVING count(*) >= 2 INTERSECT SELECT car_makers.id , car_makers.maker FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id HAVING count(*) > 3
SELECT countries.countryid , countries.countryname FROM countries JOIN car_makers ON countries.countryid = car_makers.country GROUP BY countries.countryid HAVING count(*) > 3 UNION SELECT car_makers.country , countries.countryname FROM model_list JOIN car_makers ON model_list.maker = car_makers.id JOIN countries ON car_makers.country = countries.countryid WHERE model_list.model = "fiat" 
SELECT countries.countryid , countries.countryname FROM countries JOIN car_makers ON countries.countryid = car_makers.country GROUP BY countries.countryid HAVING count(*) > 3 UNION SELECT car_makers.country , countries.countryname FROM model_list JOIN car_makers ON model_list.maker = car_makers.id JOIN countries ON car_makers.country = countries.countryid WHERE model_list.model = "fiat" 
SELECT airlines.country FROM airlines WHERE airlines.airline = "JetBlue Airways"
SELECT airlines.country FROM airlines WHERE airlines.airline = "JetBlue Airways"
SELECT airlines.abbreviation FROM airlines WHERE airlines.airline = "JetBlue Airways"
SELECT airlines.abbreviation FROM airlines WHERE airlines.airline = "JetBlue Airways"
SELECT airlines.airline , airlines.abbreviation FROM airlines WHERE airlines.country = "USA"
SELECT airlines.airline , airlines.abbreviation FROM airlines WHERE airlines.country = "USA"
SELECT airports.airportcode , airports.airportname FROM airports WHERE airports.city = "Anthony"
SELECT airports.airportcode , airports.airportname FROM airports WHERE airports.city = "Anthony"
SELECT count(*) FROM airlines
SELECT count(*) FROM airlines
SELECT count(*) FROM airports
SELECT count(*) FROM airports
SELECT count(*) FROM flights
SELECT count(*) FROM flights
SELECT airlines.airline FROM airlines WHERE airlines.abbreviation = "UAL"
SELECT airlines.airline FROM airlines WHERE airlines.abbreviation = "UAL"
SELECT count(*) FROM airlines WHERE airlines.country = "USA"
SELECT count(*) FROM airlines WHERE airlines.country = "USA"
SELECT airports.city , airports.country FROM airports WHERE airports.airportname = "Alton"
SELECT airports.city , airports.country FROM airports WHERE airports.airportname = "Alton"
SELECT airports.airportname FROM airports WHERE airports.airportcode = "AKO"
SELECT airports.airportname FROM airports WHERE airports.airportcode = "AKO"
SELECT airports.airportname FROM airports WHERE airports.city = "Aberdeen"
SELECT airports.airportname FROM airports WHERE airports.city = "Aberdeen"
SELECT count(*) FROM flights WHERE flights.sourceairport = "APG"
SELECT count(*) FROM flights WHERE flights.sourceairport = "APG"
SELECT count(*) FROM flights WHERE flights.destairport = "ATO"
SELECT count(*) FROM flights WHERE flights.sourceairport = "ATO"
SELECT count(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen"
SELECT count(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen"
SELECT count(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen"
SELECT count(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen"
SELECT count(*) FROM ( SELECT * FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen" INTERSECT SELECT * FROM flights JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.city = "Ashley" )
SELECT count(*) FROM ( SELECT * FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen" INTERSECT SELECT * FROM flights JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.city = "Ashley" )
SELECT count(*) FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE airlines.airline = "JetBlue Airways"
SELECT count(*) FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE airlines.airline = "JetBlue Airways"
SELECT count(*) FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "ASY" AND airlines.airline = "United Airlines"
SELECT count(*) FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "ASY" AND airlines.airline = "United Airlines"
SELECT count(*) FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "AHD" AND airlines.airline = "United Airlines"
SELECT count(*) FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "AHD" AND airlines.airline = "United Airlines"
SELECT count(*) FROM airlines JOIN flights ON airlines.uid = flights.airline JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen" AND airlines.airline = "United Airlines"
SELECT count(*) FROM airlines JOIN flights ON airlines.uid = flights.airline JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen" AND airlines.airline = "United Airlines"
SELECT airports.city FROM flights JOIN airports ON flights.sourceairport = airports.airportcode GROUP BY airports.city ORDER BY count(*) DESC LIMIT 1
SELECT airports.city FROM airports JOIN flights ON airports.airportcode = flights.destairport GROUP BY airports.city ORDER BY count(*) DESC LIMIT 1
SELECT airports.city FROM flights JOIN airports ON flights.sourceairport = airports.airportcode GROUP BY airports.city ORDER BY count(*) DESC LIMIT 1
SELECT airports.city FROM flights JOIN airports ON flights.sourceairport = airports.airportcode GROUP BY airports.city ORDER BY count(*) DESC LIMIT 1
SELECT airports.airportcode FROM airports JOIN flights ON airports.airportcode = flights.sourceairport GROUP BY airports.airportcode ORDER BY count(*) DESC LIMIT 1
SELECT airports.airportcode FROM airports JOIN flights ON airports.airportcode = flights.sourceairport GROUP BY airports.airportcode ORDER BY count(*) DESC LIMIT 1
SELECT airports.airportcode FROM airports JOIN flights ON airports.airportcode = flights.sourceairport GROUP BY airports.airportcode ORDER BY count(*) ASC LIMIT 1
SELECT airports.airportcode FROM airports JOIN flights ON airports.airportcode = flights.sourceairport GROUP BY airports.airportcode ORDER BY count(*) ASC LIMIT 1
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline GROUP BY airlines.airline ORDER BY count(*) DESC LIMIT 1
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline GROUP BY airlines.airline ORDER BY count(*) DESC LIMIT 1
SELECT airlines.abbreviation , airlines.country FROM airlines JOIN flights ON airlines.uid = flights.airline GROUP BY flights.airline ORDER BY count(*) ASC LIMIT 1
SELECT airlines.abbreviation , airlines.country FROM airlines JOIN flights ON airlines.uid = flights.airline GROUP BY flights.airline ORDER BY count(*) ASC LIMIT 1
SELECT airlines.airline FROM flights JOIN airports ON flights.sourceairport = airports.airportcode JOIN airlines ON airports.airportcode = airlines.uid WHERE flights.sourceairport = "AHD"
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "AHD"
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.destairport = "AHD"
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.destairport = "AHD"
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "APG" INTERSECT SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "CVO"
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "APG" INTERSECT SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "CVO"
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "CVO" EXCEPT SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "APG"
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE flights.sourceairport = "CVO" EXCEPT SELECT airlines.airline FROM airlines JOIN airports ON airlines.uid = airports.airportcode WHERE airports.airportcode = "APG"
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline GROUP BY flights.airline HAVING count(*) >= 10
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline GROUP BY flights.airline HAVING count(*) >= 10
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline HAVING count(flights.flightno) < 200
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline HAVING count(flights.flightno) < 200
SELECT flights.flightno FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE airlines.airline = "United Airlines"
SELECT flights.flightno FROM airlines JOIN flights ON airlines.uid = flights.airline WHERE airlines.airline = "United Airlines"
SELECT flights.flightno FROM flights WHERE flights.sourceairport = "APG"
SELECT flights.flightno FROM flights WHERE flights.sourceairport = "APG"
SELECT flights.flightno FROM flights WHERE flights.sourceairport = "APG"
SELECT flights.flightno FROM flights WHERE flights.sourceairport = "APG"
SELECT flights.flightno FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen"
SELECT flights.flightno FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen"
SELECT flights.flightno FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen"
SELECT flights.flightno FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen"
SELECT count(*) FROM airports JOIN flights ON airports.airportcode = flights.destairport WHERE airports.city = "Aberdeen" OR airports.city = "Abilene"
SELECT count(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = "Aberdeen" OR airports.city = "Abilene"
SELECT airports.airportname FROM airports EXCEPT SELECT airports.airportname FROM flights JOIN airports ON flights.sourceairport = airports.airportcode
SELECT airports.airportname FROM airports EXCEPT SELECT airports.airportname FROM flights JOIN airports ON flights.sourceairport = airports.airportcode
SELECT count(*) FROM employee
SELECT count(*) FROM employee
SELECT employee.name FROM employee ORDER BY employee.age ASC
SELECT employee.name FROM employee ORDER BY employee.age ASC
SELECT employee.city , count(*) FROM employee GROUP BY employee.city
SELECT count(*) , employee.city FROM employee GROUP BY employee.city
SELECT employee.city FROM employee WHERE employee.age < 30
SELECT employee.city FROM employee WHERE employee.age < 30 GROUP BY employee.city HAVING count(*) > 1
SELECT count(*) , shop.location FROM shop GROUP BY shop.location
SELECT count(*) , shop.location FROM shop GROUP BY shop.location
SELECT shop.manager_name , shop.district FROM shop ORDER BY shop.number_products DESC LIMIT 1
SELECT shop.manager_name , shop.district FROM shop ORDER BY shop.number_products DESC LIMIT 1
SELECT min(shop.number_products) , max(shop.number_products) FROM shop
SELECT min(shop.number_products) , max(shop.number_products) FROM shop
SELECT shop.name , shop.location , shop.district FROM shop ORDER BY shop.number_products DESC
SELECT shop.name , shop.location , shop.district FROM shop ORDER BY shop.number_products DESC
SELECT shop.name FROM shop WHERE shop.number_products > ( SELECT avg(shop.number_products) FROM shop )
SELECT shop.name FROM shop WHERE shop.number_products > ( SELECT avg(shop.number_products) FROM shop )
SELECT employee.name FROM evaluation JOIN employee ON evaluation.employee_id = employee.employee_id GROUP BY evaluation.employee_id ORDER BY count(*) DESC LIMIT 1
SELECT employee.name FROM employee JOIN evaluation ON employee.employee_id = evaluation.employee_id GROUP BY evaluation.employee_id ORDER BY count(*) DESC LIMIT 1
SELECT employee.name FROM employee JOIN evaluation ON employee.employee_id = evaluation.employee_id ORDER BY evaluation.bonus DESC LIMIT 1
SELECT employee.name FROM employee JOIN evaluation ON employee.employee_id = evaluation.employee_id ORDER BY evaluation.bonus DESC LIMIT 1
SELECT employee.name FROM employee WHERE employee.employee_id not in ( SELECT evaluation.employee_id FROM evaluation )
SELECT employee.name FROM employee WHERE employee.employee_id not in ( SELECT evaluation.employee_id FROM evaluation )
SELECT shop.name FROM hiring JOIN shop ON hiring.shop_id = shop.shop_id GROUP BY hiring.shop_id ORDER BY count(*) DESC LIMIT 1
SELECT shop.name FROM hiring JOIN shop ON hiring.shop_id = shop.shop_id GROUP BY shop.shop_id ORDER BY count(*) DESC LIMIT 1
SELECT shop.name FROM shop WHERE shop.shop_id not in ( SELECT hiring.shop_id FROM hiring )
SELECT shop.name FROM shop WHERE shop.shop_id not in ( SELECT hiring.shop_id FROM hiring )
SELECT count(*) , shop.name FROM hiring JOIN shop ON hiring.shop_id = shop.shop_id GROUP BY shop.shop_id
SELECT count(*) , shop.name FROM hiring JOIN shop ON hiring.shop_id = shop.shop_id GROUP BY shop.name
SELECT sum(evaluation.bonus) FROM evaluation
SELECT sum(evaluation.bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT shop.district FROM shop WHERE shop.number_products < 3000 INTERSECT SELECT shop.district FROM shop WHERE shop.number_products > 10000
SELECT shop.district FROM shop WHERE shop.number_products < 3000 INTERSECT SELECT shop.district FROM shop WHERE shop.number_products > 10000
SELECT count(DISTINCT shop.location) FROM shop
SELECT count(DISTINCT shop.location) FROM shop
SELECT count(*) FROM documents
SELECT count(*) FROM documents
SELECT documents.document_id , documents.document_name , documents.document_description FROM documents
SELECT documents.document_id , documents.document_name , documents.document_description FROM documents
SELECT documents.document_name , documents.template_id FROM documents WHERE documents.document_description like "%w%"
SELECT documents.document_name , documents.template_id FROM documents WHERE documents.document_description like "%w%"
SELECT documents.document_id , documents.template_id , documents.document_description FROM documents WHERE documents.document_name = "Robbin CV"
SELECT documents.document_id , documents.template_id , documents.document_description FROM documents WHERE documents.document_name = "Robbin CV"
SELECT count(DISTINCT documents.template_id) FROM documents
SELECT count(DISTINCT documents.template_id) FROM documents
SELECT count(*) FROM documents JOIN templates ON documents.template_id = templates.template_id WHERE templates.template_type_code = "PPT"
SELECT count(*) FROM documents JOIN templates ON documents.template_id = templates.template_id WHERE templates.template_type_code = "PPT"
SELECT documents.template_id , count(*) FROM documents GROUP BY documents.template_id
SELECT documents.template_id , count(*) FROM documents GROUP BY documents.template_id
SELECT templates.template_id , templates.template_type_code FROM templates JOIN documents ON templates.template_id = documents.template_id GROUP BY documents.template_id ORDER BY count(*) DESC LIMIT 1
SELECT documents.template_id , templates.template_type_code FROM templates JOIN documents ON templates.template_id = documents.template_id GROUP BY documents.template_id ORDER BY count(*) DESC LIMIT 1
SELECT documents.template_id FROM documents GROUP BY documents.template_id HAVING count(*) > 1
SELECT documents.template_id FROM documents GROUP BY documents.template_id HAVING count(*) > 1
SELECT templates.template_id FROM templates EXCEPT SELECT documents.template_id FROM documents
SELECT templates.template_id FROM templates EXCEPT SELECT documents.template_id FROM documents
SELECT count(*) FROM templates
SELECT count(*) FROM templates
SELECT templates.template_id , templates.version_number , templates.template_type_code FROM templates
SELECT templates.template_id , templates.version_number , templates.template_type_code FROM templates
SELECT DISTINCT templates.template_type_code FROM templates
SELECT DISTINCT templates.template_type_code FROM templates
SELECT templates.template_id FROM templates WHERE templates.template_type_code = "PP" OR templates.template_type_code = "PPT"
SELECT templates.template_id FROM templates WHERE templates.template_type_code = "PP" OR templates.template_type_code = "PPT"
SELECT count(*) FROM templates WHERE templates.template_type_code = "CV"
SELECT count(*) FROM templates WHERE templates.template_type_code = "CV"
SELECT templates.version_number , templates.template_type_code FROM templates WHERE templates.version_number > 5
SELECT templates.version_number , templates.template_type_code FROM templates WHERE templates.version_number > 5
SELECT templates.template_type_code , count(*) FROM templates GROUP BY templates.template_type_code
SELECT templates.template_type_code , count(*) FROM templates GROUP BY templates.template_type_code
SELECT templates.template_type_code FROM templates GROUP BY templates.template_type_code ORDER BY count(*) DESC LIMIT 1
SELECT templates.template_type_code FROM templates GROUP BY templates.template_type_code ORDER BY count(*) DESC LIMIT 1
SELECT templates.template_type_code FROM templates GROUP BY templates.template_type_code HAVING count(*) < 3
SELECT templates.template_type_code FROM templates GROUP BY templates.template_type_code HAVING count(*) < 3
SELECT templates.version_number , templates.template_type_code FROM templates ORDER BY templates.version_number ASC LIMIT 1
SELECT templates.version_number , templates.template_type_code FROM templates ORDER BY templates.version_number ASC LIMIT 1
SELECT templates.template_type_code FROM templates JOIN documents ON templates.template_id = documents.template_id WHERE documents.document_name = "Data base"
SELECT templates.template_type_code FROM templates JOIN documents ON templates.template_id = documents.template_id WHERE documents.document_name = "Data base"
SELECT documents.document_name FROM documents JOIN templates ON documents.template_id = templates.template_id WHERE templates.template_type_code = "BK"
SELECT documents.document_name FROM documents JOIN templates ON documents.template_id = templates.template_id WHERE templates.template_type_code = "BK"
SELECT templates.template_type_code , count(*) FROM documents JOIN templates ON documents.template_id = templates.template_id GROUP BY templates.template_type_code
SELECT templates.template_type_code , count(*) FROM documents JOIN templates ON documents.template_id = templates.template_id GROUP BY templates.template_type_code
SELECT templates.template_type_code FROM templates JOIN documents ON templates.template_id = documents.template_id GROUP BY templates.template_type_code ORDER BY count(*) DESC LIMIT 1
SELECT templates.template_type_code FROM templates JOIN documents ON templates.template_id = documents.template_id GROUP BY templates.template_type_code ORDER BY count(*) DESC LIMIT 1
SELECT templates.template_type_code FROM templates EXCEPT SELECT templates.template_type_code FROM documents JOIN templates ON documents.template_id = templates.template_id
SELECT templates.template_type_code FROM templates EXCEPT SELECT templates.template_type_code FROM documents JOIN templates ON documents.template_id = templates.template_id
SELECT ref_template_types.template_type_code , ref_template_types.template_type_description FROM ref_template_types
SELECT ref_template_types.template_type_code , ref_template_types.template_type_description FROM ref_template_types
SELECT ref_template_types.template_type_description FROM ref_template_types WHERE ref_template_types.template_type_code = "AD"
SELECT ref_template_types.template_type_description FROM ref_template_types WHERE ref_template_types.template_type_code = "AD"
SELECT ref_template_types.template_type_code FROM ref_template_types WHERE ref_template_types.template_type_description = "Book"
SELECT ref_template_types.template_type_code FROM ref_template_types WHERE ref_template_types.template_type_description = "Book"
SELECT DISTINCT ref_template_types.template_type_description FROM ref_template_types JOIN templates ON ref_template_types.template_type_code = templates.template_type_code JOIN documents ON templates.template_id = documents.template_id
SELECT DISTINCT ref_template_types.template_type_description FROM ref_template_types JOIN templates ON ref_template_types.template_type_code = templates.template_type_code JOIN documents ON templates.template_id = documents.template_id
SELECT templates.template_id FROM templates JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code WHERE ref_template_types.template_type_description = "Presentation"
SELECT templates.template_id FROM templates JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code WHERE ref_template_types.template_type_description = "Presentation"
SELECT count(*) FROM paragraphs
SELECT count(*) FROM paragraphs
SELECT count(*) FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id WHERE documents.document_name = "Summer Show"
SELECT count(*) FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id WHERE documents.document_name = "Summer Show"
SELECT paragraphs.other_details FROM paragraphs WHERE paragraphs.paragraph_text = "Korea"
SELECT paragraphs.other_details FROM paragraphs WHERE paragraphs.paragraph_text like "%korea%"
SELECT paragraphs.paragraph_id , paragraphs.paragraph_text FROM paragraphs JOIN documents ON paragraphs.document_id = documents.document_id WHERE documents.document_name = "Welcome to NY"
SELECT paragraphs.paragraph_id , paragraphs.paragraph_text FROM paragraphs JOIN documents ON paragraphs.document_id = documents.document_id WHERE documents.document_name = "Welcome to NY"
SELECT paragraphs.paragraph_text FROM paragraphs JOIN documents ON paragraphs.document_id = documents.document_id WHERE documents.document_name = "Customer reviews"
SELECT paragraphs.paragraph_text FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id WHERE documents.document_name = "Customer reviews"
SELECT count(paragraphs.document_id) , count(*) FROM paragraphs GROUP BY paragraphs.document_id ORDER BY count(*) ASC
SELECT count(*) , paragraphs.document_id FROM paragraphs GROUP BY paragraphs.document_id ORDER BY paragraphs.document_id ASC
SELECT documents.document_id , documents.document_name , count(*) FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id
SELECT documents.document_id , documents.document_name , count(*) FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id
SELECT paragraphs.document_id FROM paragraphs GROUP BY paragraphs.document_id HAVING count(*) >= 2
SELECT paragraphs.document_id FROM paragraphs GROUP BY paragraphs.document_id HAVING count(*) >= 2
SELECT documents.document_id , documents.document_name FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id ORDER BY count(*) DESC LIMIT 1
SELECT documents.document_id , documents.document_name FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id ORDER BY count(*) DESC LIMIT 1
SELECT paragraphs.document_id FROM paragraphs GROUP BY paragraphs.document_id ORDER BY count(*) ASC LIMIT 1
SELECT paragraphs.document_id FROM paragraphs GROUP BY paragraphs.document_id ORDER BY count(*) ASC LIMIT 1
SELECT paragraphs.document_id FROM paragraphs GROUP BY paragraphs.document_id HAVING count(*) between 1 AND 2
SELECT paragraphs.document_id FROM paragraphs GROUP BY paragraphs.document_id HAVING count(*) between 1 AND 2
SELECT paragraphs.document_id FROM paragraphs WHERE paragraphs.paragraph_text = "Brazil" INTERSECT SELECT paragraphs.document_id FROM paragraphs WHERE paragraphs.paragraph_text = "Ireland"
SELECT paragraphs.document_id FROM paragraphs WHERE paragraphs.paragraph_text = "Brazil" INTERSECT SELECT paragraphs.document_id FROM paragraphs WHERE paragraphs.paragraph_text = "Ireland"
SELECT count(*) FROM teacher
SELECT count(*) FROM teacher
SELECT teacher.name FROM teacher ORDER BY teacher.age ASC
SELECT teacher.name FROM teacher ORDER BY teacher.age ASC
SELECT teacher.age , teacher.hometown FROM teacher
SELECT teacher.age , teacher.hometown FROM teacher
SELECT teacher.name FROM teacher WHERE teacher.hometown != "Little Lever Urban District"
SELECT teacher.name FROM teacher WHERE teacher.hometown != "Little Lever Urban District"
SELECT teacher.name FROM teacher WHERE teacher.age = 32 OR teacher.age = 33
SELECT teacher.name FROM teacher WHERE teacher.age = 32 OR teacher.age = 33
SELECT teacher.hometown FROM teacher ORDER BY teacher.age ASC LIMIT 1
SELECT teacher.hometown FROM teacher ORDER BY teacher.age ASC LIMIT 1
SELECT teacher.hometown , count(*) FROM teacher GROUP BY teacher.hometown
SELECT teacher.hometown , count(*) FROM teacher GROUP BY teacher.hometown
SELECT teacher.hometown FROM teacher GROUP BY teacher.hometown ORDER BY count(*) DESC LIMIT 1
SELECT teacher.hometown FROM teacher GROUP BY teacher.hometown ORDER BY count(*) DESC LIMIT 1
SELECT teacher.hometown FROM teacher GROUP BY teacher.hometown HAVING count(*) >= 2
SELECT teacher.hometown FROM teacher GROUP BY teacher.hometown HAVING count(*) >= 2
SELECT teacher.name , course.course FROM course_arrange JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id JOIN course ON course_arrange.course_id = course.course_id
SELECT teacher.name , course.course FROM course_arrange JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id JOIN course ON course_arrange.course_id = course.course_id
SELECT teacher.name , course.course FROM course_arrange JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id JOIN course ON course_arrange.course_id = course.course_id ORDER BY teacher.name ASC
SELECT teacher.name , course.course FROM course_arrange JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id JOIN course ON course_arrange.course_id = course.course_id ORDER BY teacher.name ASC
SELECT teacher.name FROM course_arrange JOIN course ON course_arrange.course_id = course.course_id JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id WHERE course.course = "Math"
SELECT teacher.name FROM course_arrange JOIN course ON course_arrange.course_id = course.course_id JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id WHERE course.course = "Math"
SELECT teacher.name , count(*) FROM course_arrange JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id GROUP BY teacher.name
SELECT teacher.name , count(*) FROM course_arrange JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id GROUP BY teacher.name
SELECT teacher.name FROM course_arrange JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id GROUP BY teacher.name HAVING count(*) >= 2
SELECT teacher.name FROM course_arrange JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id GROUP BY teacher.name HAVING count(*) >= 2
SELECT teacher.name FROM teacher WHERE teacher.teacher_id not in ( SELECT course_arrange.teacher_id FROM course_arrange )
SELECT teacher.name FROM teacher WHERE teacher.teacher_id not in ( SELECT course_arrange.teacher_id FROM course_arrange )
SELECT count(*) FROM visitor WHERE visitor.age < 30
SELECT visitor.name FROM visitor WHERE visitor.level_of_membership > 4 ORDER BY visitor.level_of_membership DESC
SELECT avg(visitor.age) FROM visitor WHERE visitor.level_of_membership <= 4
SELECT visitor.name , visitor.level_of_membership FROM visitor WHERE visitor.level_of_membership > 4 ORDER BY visitor.age DESC
SELECT museum.museum_id , museum.name FROM museum ORDER BY museum.num_of_staff DESC LIMIT 1
SELECT avg(museum.num_of_staff) FROM museum WHERE museum.open_year < 2009
SELECT museum.open_year , museum.num_of_staff FROM museum WHERE museum.name = "Plaza Museum"
SELECT museum.name FROM museum WHERE museum.num_of_staff > ( SELECT min(museum.num_of_staff) FROM museum WHERE museum.open_year > 2010 )
SELECT visitor.id , visitor.name , visitor.age FROM visitor JOIN visit ON visitor.id = visit.visitor_id GROUP BY visitor.id HAVING count(*) > 1
SELECT visitor.id , visitor.name , visitor.level_of_membership FROM visitor JOIN visit ON visitor.id = visit.visitor_id GROUP BY visitor.id ORDER BY sum(visit.total_spent) DESC LIMIT 1
SELECT museum.museum_id , museum.name FROM museum JOIN visit ON museum.museum_id = visit.museum_id GROUP BY visit.museum_id ORDER BY count(*) DESC LIMIT 1
SELECT museum.name FROM museum WHERE museum.museum_id not in ( SELECT visit.museum_id FROM visit )
SELECT visitor.name , visitor.age FROM visit JOIN visitor ON visit.visitor_id = visitor.id GROUP BY visit.visitor_id ORDER BY sum(visit.num_of_ticket) DESC LIMIT 1
SELECT avg(visit.num_of_ticket) , max(visit.num_of_ticket) FROM visit
SELECT sum(visit.total_spent) FROM visit JOIN visitor ON visit.visitor_id = visitor.id WHERE visitor.level_of_membership = 1
SELECT visitor.name FROM visit JOIN museum ON visit.museum_id = museum.museum_id JOIN visitor ON visit.visitor_id = visitor.id WHERE museum.open_year < 2009 INTERSECT SELECT visitor.name FROM visit JOIN museum ON visit.museum_id = museum.museum_id JOIN visitor ON visit.visitor_id = visitor.id WHERE museum.open_year > 2011
SELECT count(*) FROM visitor WHERE visitor.id not in ( SELECT visit.visitor_id FROM visit JOIN museum ON visit.museum_id = museum.museum_id WHERE museum.open_year > 2010 )
SELECT count(*) FROM museum WHERE museum.open_year > 2013 OR museum.open_year < 2008
SELECT count(*) FROM players
SELECT count(*) FROM players
SELECT count(*) FROM matches
SELECT count(*) FROM matches
SELECT players.first_name , players.birth_date FROM players WHERE players.country_code = "USA"
SELECT players.first_name , players.birth_date FROM players WHERE players.country_code = "USA"
SELECT avg(matches.loser_age) FROM matches
SELECT avg(matches.loser_age) FROM matches
SELECT avg(matches.winner_rank) FROM matches
SELECT avg(matches.winner_rank) FROM matches
SELECT min(matches.loser_rank) FROM matches
SELECT min(matches.loser_rank) FROM matches
SELECT count(DISTINCT players.country_code) FROM players
SELECT count(DISTINCT players.country_code) FROM players
SELECT count(DISTINCT matches.loser_name) FROM matches
SELECT count(DISTINCT matches.loser_name) FROM matches
SELECT matches.tourney_name FROM matches GROUP BY matches.tourney_name HAVING count(*) > 10
SELECT matches.tourney_name FROM matches GROUP BY matches.tourney_name HAVING count(*) > 10
SELECT matches.winner_name FROM matches WHERE matches.year = 2013 INTERSECT SELECT matches.winner_name FROM matches WHERE matches.year = 2016
SELECT players.first_name , players.last_name FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.year = 2013 INTERSECT SELECT players.first_name , players.last_name FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.year = 2016
SELECT count(*) FROM matches WHERE matches.year = 2013 OR matches.year = 2016
SELECT count(*) FROM matches WHERE matches.year = 2013 OR matches.year = 2016
SELECT players.country_code , players.first_name FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = "WTA Championships" INTERSECT SELECT players.country_code , players.first_name FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = "Australian Open"
SELECT players.first_name , players.country_code FROM players JOIN rankings ON players.player_id = rankings.player_id JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = "WTA Championships" INTERSECT SELECT players.first_name , players.country_code FROM players JOIN rankings ON players.player_id = rankings.player_id JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = "Australian Open"
SELECT players.first_name , players.country_code FROM players ORDER BY players.birth_date DESC LIMIT 1
SELECT players.first_name , players.country_code FROM players ORDER BY players.birth_date DESC LIMIT 1
SELECT players.first_name , players.last_name FROM players ORDER BY players.birth_date ASC
SELECT players.first_name , players.last_name FROM players ORDER BY players.birth_date ASC
SELECT players.first_name , players.last_name FROM players WHERE players.hand = "L" ORDER BY players.birth_date ASC
SELECT players.first_name , players.last_name FROM players WHERE players.hand = "L" ORDER BY players.birth_date ASC
SELECT players.first_name , players.country_code FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY rankings.player_id ORDER BY count(*) DESC LIMIT 1
SELECT players.first_name , players.country_code FROM rankings JOIN players ON rankings.player_id = players.player_id GROUP BY rankings.player_id ORDER BY count(*) DESC LIMIT 1
SELECT matches.year FROM matches GROUP BY matches.year ORDER BY count(*) DESC LIMIT 1
SELECT matches.year FROM matches GROUP BY matches.year ORDER BY count(*) DESC LIMIT 1
SELECT matches.winner_name , matches.winner_rank_points FROM matches GROUP BY matches.winner_id ORDER BY count(*) DESC LIMIT 1
SELECT matches.winner_name , matches.winner_rank_points FROM matches GROUP BY matches.winner_id ORDER BY count(*) DESC LIMIT 1
SELECT matches.winner_name FROM matches WHERE matches.tourney_name = "Australian Open" ORDER BY matches.winner_rank_points DESC LIMIT 1
SELECT matches.winner_name FROM matches WHERE matches.tourney_name = "Australian Open" ORDER BY matches.winner_rank_points DESC LIMIT 1
SELECT matches.loser_name , matches.winner_name FROM matches WHERE matches.minutes = ( SELECT max(matches.minutes) FROM matches )
SELECT matches.winner_name , matches.loser_name FROM matches ORDER BY matches.minutes DESC LIMIT 1
SELECT avg(rankings.ranking) , players.first_name FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name
SELECT players.first_name , avg(rankings.ranking) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name
SELECT sum(rankings.ranking_points) , players.first_name FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name
SELECT players.first_name , sum(rankings.ranking_points) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name
SELECT count(*) , players.country_code FROM players GROUP BY players.country_code
SELECT players.country_code , count(*) FROM players GROUP BY players.country_code
SELECT players.country_code FROM players GROUP BY players.country_code ORDER BY count(*) DESC LIMIT 1
SELECT players.country_code FROM players GROUP BY players.country_code ORDER BY count(*) DESC LIMIT 1
SELECT players.country_code FROM players GROUP BY players.country_code HAVING count(*) > 50
SELECT players.country_code FROM players GROUP BY players.country_code HAVING count(*) > 50
SELECT sum(rankings.tours) , rankings.ranking_date FROM rankings GROUP BY rankings.ranking_date
SELECT count(*) , rankings.ranking_date FROM rankings GROUP BY rankings.ranking_date
SELECT count(*) , matches.year FROM matches GROUP BY matches.year
SELECT count(*) , matches.year FROM matches GROUP BY matches.year
SELECT matches.winner_name , matches.winner_rank FROM matches ORDER BY matches.winner_age ASC LIMIT 3
SELECT matches.winner_name , matches.winner_rank FROM matches ORDER BY matches.winner_age ASC LIMIT 3
SELECT count(DISTINCT matches.winner_name) FROM matches WHERE matches.loser_hand = "L" AND matches.tourney_name = "WTA Championships"
SELECT count(*) FROM matches WHERE matches.winner_hand = "L" AND matches.tourney_name = "WTA Championships"
SELECT players.first_name , players.country_code , players.birth_date FROM players JOIN matches ON players.player_id = matches.winner_id ORDER BY matches.winner_rank_points DESC LIMIT 1
SELECT players.first_name , players.country_code , players.birth_date FROM players JOIN rankings ON players.player_id = rankings.player_id JOIN matches ON players.player_id = matches.winner_id ORDER BY matches.winner_rank_points DESC LIMIT 1
SELECT players.hand , count(*) FROM players GROUP BY players.hand
SELECT players.hand , count(*) FROM players GROUP BY players.hand
SELECT count(*) FROM ship WHERE ship.disposition_of_ship = "Captured"
SELECT ship.name , ship.tonnage FROM ship ORDER BY ship.name DESC
SELECT battle.name , battle.date , battle.result FROM battle
SELECT max(death.killed) , min(death.killed) FROM death GROUP BY death.caused_by_ship_id
SELECT avg(death.injured) FROM death GROUP BY death.caused_by_ship_id
SELECT death.note , death.injured FROM death JOIN ship ON death.caused_by_ship_id = ship.id WHERE ship.tonnage = "t"
SELECT battle.name , battle.result FROM battle WHERE battle.bulgarian_commander != "Boril"
SELECT DISTINCT battle.id , battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.ship_type = "Brig"
SELECT battle.id , battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle JOIN death ON ship.id = death.caused_by_ship_id GROUP BY battle.id HAVING sum(death.killed) > 10
SELECT ship.id , ship.name FROM death JOIN ship ON death.caused_by_ship_id = ship.id GROUP BY ship.id ORDER BY sum(death.injured) DESC LIMIT 1
SELECT DISTINCT battle.name FROM battle WHERE battle.bulgarian_commander = "Kaloyan" AND battle.latin_commander = "Baldwin I"
SELECT count(DISTINCT battle.result) FROM battle
SELECT count(*) FROM battle WHERE battle.id not in ( SELECT ship.lost_in_battle FROM ship WHERE ship.tonnage = 225 )
SELECT battle.name , battle.date FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.name = "Lettice" INTERSECT SELECT battle.name , battle.date FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.name = "HMS Atalanta"
SELECT battle.name , battle.result , battle.bulgarian_commander FROM battle
SELECT death.note FROM death WHERE death.note like "%east%"
SELECT addresses.line_1 , addresses.line_2 FROM addresses
SELECT addresses.line_1 , addresses.line_2 FROM addresses
SELECT count(*) FROM courses
SELECT count(*) FROM courses
SELECT courses.course_description FROM courses JOIN sections ON courses.course_id = sections.course_id WHERE courses.course_name = "math"
SELECT courses.course_description FROM courses JOIN sections ON courses.course_id = sections.course_id WHERE courses.course_name = "math"
SELECT addresses.zip_postcode FROM addresses WHERE addresses.city = "Port Chelsea"
SELECT addresses.zip_postcode FROM addresses WHERE addresses.city = "Port Chelsea"
SELECT departments.department_name , departments.department_id FROM departments JOIN degree_programs ON departments.department_id = degree_programs.department_id GROUP BY degree_programs.department_id ORDER BY count(*) DESC LIMIT 1
SELECT departments.department_name , departments.department_id FROM degree_programs JOIN departments ON degree_programs.department_id = departments.department_id GROUP BY degree_programs.department_id ORDER BY count(*) DESC LIMIT 1
SELECT count(DISTINCT degree_programs.department_id) FROM degree_programs
SELECT count(DISTINCT degree_programs.department_id) FROM degree_programs
SELECT count(DISTINCT degree_programs.degree_summary_name) FROM degree_programs
SELECT count(DISTINCT degree_programs.degree_summary_name) FROM degree_programs
SELECT count(*) FROM departments JOIN degree_programs ON departments.department_id = degree_programs.department_id WHERE departments.department_name = "engineer"
SELECT count(*) FROM departments JOIN degree_programs ON departments.department_id = degree_programs.department_id WHERE departments.department_name = "engineer"
SELECT sections.section_name , sections.section_description FROM sections
SELECT sections.section_name , sections.section_description FROM sections
SELECT courses.course_name , courses.course_id FROM courses JOIN sections ON courses.course_id = sections.course_id GROUP BY courses.course_id HAVING count(*) <= 2
SELECT courses.course_name , courses.course_id FROM courses JOIN sections ON courses.course_id = sections.course_id GROUP BY sections.course_id HAVING count(*) < 2
SELECT sections.section_name FROM sections ORDER BY sections.section_name DESC
SELECT sections.section_name FROM sections ORDER BY sections.section_name DESC
SELECT semesters.semester_name , semesters.semester_id FROM semesters JOIN student_enrolment ON semesters.semester_id = student_enrolment.semester_id GROUP BY semesters.semester_id ORDER BY count(*) DESC LIMIT 1
SELECT semesters.semester_name , semesters.semester_id FROM semesters JOIN student_enrolment ON semesters.semester_id = student_enrolment.semester_id GROUP BY semesters.semester_id ORDER BY count(*) DESC LIMIT 1
SELECT departments.department_description FROM departments WHERE departments.department_name like "%the computer%"
SELECT departments.department_description FROM departments WHERE departments.department_name like "%computer%"
SELECT students.first_name , students.middle_name , students.last_name , student_enrolment.student_enrolment_id FROM student_enrolment JOIN students ON student_enrolment.student_id = students.student_id GROUP BY student_enrolment.student_enrolment_id HAVING count(*) = 2
SELECT students.first_name , students.middle_name , students.student_id FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id GROUP BY students.student_id HAVING count(*) = 2
SELECT students.first_name , students.middle_name , students.last_name FROM student_enrolment JOIN students ON student_enrolment.student_id = students.student_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_programs.degree_summary_name = "Bachelor"
SELECT students.first_name , students.middle_name , students.last_name FROM student_enrolment JOIN students ON student_enrolment.student_id = students.student_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_programs.degree_summary_name = "Bachelor"
SELECT courses.course_name FROM student_enrolment JOIN student_enrolment_courses ON student_enrolment.student_enrolment_id = student_enrolment_courses.student_enrolment_id JOIN courses ON student_enrolment_courses.course_id = courses.course_id GROUP BY courses.course_name ORDER BY count(*) DESC LIMIT 1
SELECT degree_programs.degree_summary_name FROM student_enrolment JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id GROUP BY degree_programs.degree_summary_name ORDER BY count(*) DESC LIMIT 1
SELECT student_enrolment.degree_program_id , degree_programs.degree_summary_name FROM student_enrolment JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id GROUP BY student_enrolment.degree_program_id ORDER BY count(*) DESC LIMIT 1
SELECT degree_programs.degree_program_id , degree_programs.degree_summary_name FROM student_enrolment JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id GROUP BY degree_programs.degree_program_id ORDER BY count(*) DESC LIMIT 1
SELECT students.first_name , students.middle_name , count(*) FROM student_enrolment JOIN students ON student_enrolment.student_id = students.student_id GROUP BY student_enrolment.student_id ORDER BY count(*) DESC LIMIT 1
SELECT students.first_name , students.middle_name , count(students.last_name) , count(*) FROM student_enrolment JOIN students ON student_enrolment.student_id = students.student_id GROUP BY students.student_id ORDER BY count(*) DESC LIMIT 1
SELECT semesters.semester_name FROM semesters WHERE semesters.semester_id not in ( SELECT student_enrolment.semester_id FROM student_enrolment )
SELECT semesters.semester_name FROM semesters EXCEPT SELECT semesters.semester_name FROM student_enrolment JOIN semesters ON student_enrolment.semester_id = semesters.semester_id
SELECT courses.course_name FROM courses JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id
SELECT DISTINCT courses.course_name FROM courses JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id
SELECT courses.course_name FROM courses JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id GROUP BY courses.course_id ORDER BY count(*) DESC LIMIT 1
SELECT courses.course_name FROM courses JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id GROUP BY courses.course_id ORDER BY count(*) DESC LIMIT 1
SELECT students.last_name FROM students JOIN addresses ON students.current_address_id = addresses.address_id WHERE addresses.state_province_county = "NorthCarolina" EXCEPT SELECT students.last_name FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id
SELECT students.last_name FROM students JOIN addresses ON students.current_address_id = addresses.address_id WHERE addresses.state_province_county = "NorthCarolina" EXCEPT SELECT students.last_name FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id
SELECT transcripts.transcript_date , transcripts.transcript_id FROM transcripts JOIN transcript_contents ON transcripts.transcript_id = transcript_contents.transcript_id GROUP BY transcripts.transcript_id HAVING count(*) >= 2
SELECT transcripts.transcript_date , transcripts.transcript_id FROM transcripts JOIN transcript_contents ON transcripts.transcript_id = transcript_contents.transcript_id GROUP BY transcripts.transcript_id HAVING count(*) >= 2
SELECT students.cell_mobile_number FROM students WHERE students.first_name = "Timmothy" AND students.last_name = "Ward"
SELECT students.cell_mobile_number FROM students WHERE students.first_name = "Timmothy" AND students.last_name = "Ward"
SELECT students.first_name , students.middle_name , students.last_name FROM students ORDER BY students.date_first_registered ASC LIMIT 1
SELECT students.first_name , students.middle_name , students.last_name FROM students ORDER BY students.date_first_registered ASC LIMIT 1
SELECT students.first_name , students.middle_name , students.last_name FROM students ORDER BY students.date_left ASC LIMIT 1
SELECT students.first_name , students.middle_name , students.last_name FROM students ORDER BY students.date_first_registered ASC LIMIT 1
SELECT students.first_name FROM students WHERE students.permanent_address_id != students.current_address_id
SELECT students.first_name FROM students WHERE students.permanent_address_id != students.current_address_id
SELECT addresses.address_id , addresses.line_2 FROM addresses JOIN students ON addresses.address_id = students.current_address_id GROUP BY addresses.address_id ORDER BY count(*) DESC LIMIT 1
SELECT addresses.address_id , addresses.line_1 , addresses.line_2 FROM addresses JOIN students ON addresses.address_id = students.current_address_id GROUP BY addresses.address_id ORDER BY count(*) DESC LIMIT 1
SELECT avg(transcripts.transcript_date) FROM transcripts
SELECT avg(transcripts.transcript_date) FROM transcripts
SELECT transcripts.transcript_date , transcripts.other_details FROM transcripts ORDER BY transcripts.transcript_date ASC LIMIT 1
SELECT transcripts.transcript_date , transcripts.other_details FROM transcripts ORDER BY transcripts.transcript_date ASC LIMIT 1
SELECT count(*) FROM transcripts
SELECT count(*) FROM transcripts
SELECT transcripts.transcript_date FROM transcripts ORDER BY transcripts.transcript_date DESC LIMIT 1
SELECT transcripts.transcript_date FROM transcripts ORDER BY transcripts.transcript_date DESC LIMIT 1
SELECT student_enrolment.student_enrolment_id , count(*) FROM student_enrolment JOIN student_enrolment_courses ON student_enrolment.student_enrolment_id = student_enrolment_courses.student_enrolment_id JOIN transcript_contents ON student_enrolment_courses.student_course_id = transcript_contents.student_course_id JOIN transcripts ON transcript_contents.transcript_id = transcripts.transcript_id GROUP BY transcripts.transcript_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) , transcripts.transcript_id FROM transcript_contents JOIN transcripts ON transcript_contents.transcript_id = transcripts.transcript_id GROUP BY transcripts.transcript_id
SELECT transcripts.transcript_date , transcripts.transcript_id FROM transcripts JOIN transcript_contents ON transcripts.transcript_id = transcript_contents.transcript_id GROUP BY transcripts.transcript_id ORDER BY count(*) ASC LIMIT 1
SELECT transcripts.transcript_date , transcripts.transcript_id FROM transcripts JOIN transcript_contents ON transcripts.transcript_id = transcript_contents.transcript_id GROUP BY transcripts.transcript_id ORDER BY count(*) ASC LIMIT 1
SELECT semesters.semester_name FROM student_enrolment JOIN semesters ON student_enrolment.semester_id = semesters.semester_id JOIN student_enrolment_courses ON student_enrolment.student_enrolment_id = student_enrolment_courses.student_enrolment_id JOIN transcript_contents ON student_enrolment_courses.student_course_id = transcript_contents.student_course_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_programs.degree_summary_name = "Master" INTERSECT SELECT semesters.semester_name FROM student_enrolment JOIN semesters ON student_enrolment.semester_id = semesters.semester_id JOIN student_enrolment_courses ON student_enrolment.student_enrolment_id = student_enrolment_courses.student_enrolment_id JOIN transcript_contents ON student_enrolment_courses.student_course_id = transcript_contents.student_course_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_programs.degree_summary_name = "Bachelor"
SELECT semesters.semester_id FROM student_enrolment JOIN semesters ON student_enrolment.semester_id = semesters.semester_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_programs.degree_summary_name = "Master" INTERSECT SELECT student_enrolment.semester_id FROM student_enrolment JOIN semesters ON student_enrolment.semester_id = semesters.semester_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_programs.degree_summary_name = "Bachelor"
SELECT count(DISTINCT students.current_address_id) FROM students
SELECT DISTINCT addresses.line_1 FROM addresses JOIN students ON addresses.address_id = students.current_address_id
SELECT students.other_student_details FROM students ORDER BY students.other_student_details DESC
SELECT students.other_student_details FROM students ORDER BY students.other_student_details DESC
SELECT sections.section_description FROM sections WHERE sections.section_name = "h"
SELECT sections.section_description FROM sections WHERE sections.section_name = "h"
SELECT students.first_name FROM students JOIN addresses ON students.permanent_address_id = addresses.address_id WHERE addresses.country = "Haiti" OR students.cell_mobile_number = "09700166582"
SELECT students.first_name FROM students JOIN addresses ON students.permanent_address_id = addresses.address_id WHERE addresses.country = "Haiti" OR students.cell_mobile_number = "09700166582"
SELECT cartoon.title FROM cartoon ORDER BY cartoon.title ASC
SELECT cartoon.title FROM cartoon ORDER BY cartoon.title ASC
SELECT cartoon.title FROM cartoon WHERE cartoon.directed_by = "Ben Jones"
SELECT cartoon.title FROM cartoon WHERE cartoon.directed_by = "Ben Jones"
SELECT count(*) FROM cartoon WHERE cartoon.written_by = "Joseph Kuhr"
SELECT count(*) FROM cartoon WHERE cartoon.written_by = "Joseph Kuhr"
SELECT cartoon.title , cartoon.directed_by FROM cartoon ORDER BY cartoon.original_air_date ASC
SELECT cartoon.title , cartoon.directed_by FROM cartoon ORDER BY cartoon.original_air_date ASC
SELECT cartoon.title FROM cartoon WHERE cartoon.directed_by = "Ben Jones" OR cartoon.directed_by = "Brandon Vietti"
SELECT cartoon.title FROM cartoon WHERE cartoon.directed_by = "Ben Jones" OR cartoon.directed_by = "Brandon Vietti"
SELECT tv_channel.country , count(*) FROM tv_channel GROUP BY tv_channel.country ORDER BY count(*) DESC LIMIT 1
SELECT tv_channel.country , count(*) FROM tv_channel GROUP BY tv_channel.country ORDER BY count(*) DESC LIMIT 1
SELECT count(DISTINCT tv_channel.series_name) , count(DISTINCT tv_channel.content) FROM tv_channel
SELECT count(DISTINCT tv_channel.series_name) , count(DISTINCT tv_channel.content) FROM tv_channel
SELECT tv_channel.content FROM tv_channel WHERE tv_channel.series_name = "Sky Radio"
SELECT tv_channel.content FROM tv_channel WHERE tv_channel.series_name = "Sky Radio"
SELECT tv_channel.package_option FROM tv_channel WHERE tv_channel.series_name = "Sky Radio"
SELECT tv_channel.package_option FROM tv_channel WHERE tv_channel.series_name = "Sky Radio"
SELECT count(*) FROM tv_channel WHERE tv_channel.language = "English"
SELECT count(*) FROM tv_channel WHERE tv_channel.language = "English"
SELECT tv_channel.language , count(*) FROM tv_channel GROUP BY tv_channel.language ORDER BY count(*) ASC LIMIT 1
SELECT tv_channel.language , count(*) FROM tv_channel GROUP BY tv_channel.language ORDER BY count(*) ASC LIMIT 1
SELECT tv_channel.language , count(*) FROM tv_channel GROUP BY tv_channel.language
SELECT tv_channel.language , count(*) FROM tv_channel GROUP BY tv_channel.language
SELECT tv_channel.series_name FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.title = "The Rise of the Blue Beetle!"
SELECT tv_channel.series_name FROM tv_channel JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.title = "The Rise of the Blue Beetle!"
SELECT cartoon.title FROM cartoon JOIN tv_channel ON cartoon.channel = tv_channel.id WHERE tv_channel.series_name = "Sky Radio"
SELECT cartoon.title FROM cartoon JOIN tv_channel ON cartoon.channel = tv_channel.id WHERE tv_channel.series_name = "Sky Radio"
SELECT tv_series.episode FROM tv_series ORDER BY tv_series.rating ASC
SELECT tv_series.episode FROM tv_series ORDER BY tv_series.rating ASC
SELECT tv_series.episode , tv_series.rating FROM tv_series ORDER BY tv_series.rating DESC LIMIT 3
SELECT tv_series.rating FROM tv_series ORDER BY tv_series.rating DESC LIMIT 3
SELECT min(tv_series.share) , max(tv_series.share) FROM tv_series
SELECT max(tv_series.share) , min(tv_series.share) FROM tv_series
SELECT tv_series.air_date FROM tv_series WHERE tv_series.episode = "A Love of a Lifetime"
SELECT tv_series.air_date FROM tv_series WHERE tv_series.episode = "A Love of a Lifetime"
SELECT tv_series.weekly_rank FROM tv_series WHERE tv_series.episode = "A Love of a Lifetime"
SELECT tv_series.weekly_rank FROM tv_series WHERE tv_series.episode = "A Love of a Lifetime"
SELECT tv_channel.series_name FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id WHERE tv_series.episode = "A Love of a Lifetime"
SELECT tv_channel.series_name FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id WHERE tv_series.episode = "A Love of a Lifetime"
SELECT tv_series.episode FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id WHERE tv_channel.series_name = "Sky Radio"
SELECT tv_series.episode FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id WHERE tv_channel.series_name = "Sky Radio"
SELECT count(*) , cartoon.directed_by FROM cartoon GROUP BY cartoon.directed_by
SELECT cartoon.directed_by , count(*) FROM cartoon GROUP BY cartoon.directed_by
SELECT cartoon.production_code , cartoon.channel FROM cartoon ORDER BY cartoon.original_air_date DESC LIMIT 1
SELECT cartoon.production_code , cartoon.channel FROM cartoon ORDER BY cartoon.original_air_date DESC LIMIT 1
SELECT tv_channel.package_option , tv_channel.series_name FROM tv_channel WHERE tv_channel.hight_definition_tv = "yes"
SELECT tv_channel.package_option , tv_channel.series_name FROM tv_channel JOIN tv_series ON tv_channel.id = tv_series.channel WHERE tv_channel.hight_definition_tv = "yes"
SELECT tv_channel.country FROM tv_channel JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.written_by = "Todd Casey"
SELECT tv_channel.country FROM tv_channel JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.written_by = "Todd Casey"
SELECT tv_channel.country FROM tv_channel EXCEPT SELECT tv_channel.country FROM tv_channel JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.written_by = "Todd Casey"
SELECT tv_channel.country FROM tv_channel EXCEPT SELECT tv_channel.country FROM cartoon JOIN tv_channel ON cartoon.channel = tv_channel.id WHERE cartoon.written_by = "Todd Casey"
SELECT tv_channel.series_name , tv_channel.country FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.directed_by = "Ben Jones" INTERSECT SELECT tv_channel.series_name , tv_channel.country FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.directed_by = "Michael Chang"
SELECT tv_channel.series_name , tv_channel.country FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.directed_by = "Ben Jones" INTERSECT SELECT tv_channel.series_name , tv_channel.country FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.directed_by = "Michael Chang"
SELECT tv_channel.pixel_aspect_ratio_par , tv_channel.country FROM tv_channel WHERE tv_channel.language != "English"
SELECT tv_channel.pixel_aspect_ratio_par , tv_channel.country FROM tv_channel WHERE tv_channel.language != "English"
SELECT tv_channel.country FROM tv_channel GROUP BY tv_channel.country HAVING count(*) > 2
SELECT tv_channel.id FROM tv_channel GROUP BY tv_channel.id HAVING count(*) > 2
SELECT tv_channel.id FROM tv_channel EXCEPT SELECT cartoon.channel FROM cartoon WHERE cartoon.directed_by = "Ben Jones"
SELECT tv_channel.id FROM tv_channel EXCEPT SELECT cartoon.channel FROM cartoon WHERE cartoon.directed_by = "Ben Jones"
SELECT tv_channel.package_option FROM tv_channel WHERE tv_channel.id not in ( SELECT cartoon.channel FROM cartoon WHERE cartoon.directed_by = "Ben Jones" )
SELECT tv_channel.package_option FROM tv_channel EXCEPT SELECT tv_channel.package_option FROM tv_channel JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.directed_by = "Ben Jones"
SELECT count(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT poker_player.earnings FROM poker_player ORDER BY poker_player.earnings DESC
SELECT poker_player.earnings FROM poker_player ORDER BY poker_player.earnings DESC
SELECT poker_player.final_table_made , poker_player.best_finish FROM poker_player
SELECT poker_player.final_table_made , poker_player.best_finish FROM poker_player
SELECT avg(poker_player.earnings) FROM poker_player
SELECT avg(poker_player.earnings) FROM poker_player
SELECT poker_player.money_rank FROM poker_player ORDER BY poker_player.earnings DESC LIMIT 1
SELECT poker_player.money_rank FROM poker_player ORDER BY poker_player.earnings DESC LIMIT 1
SELECT max(poker_player.final_table_made) FROM poker_player WHERE poker_player.earnings < 200000
SELECT max(poker_player.final_table_made) FROM poker_player WHERE poker_player.earnings < 200000
SELECT people.name FROM poker_player JOIN people ON poker_player.people_id = people.people_id
SELECT people.name FROM poker_player JOIN people ON poker_player.people_id = people.people_id
SELECT people.name FROM poker_player JOIN people ON poker_player.people_id = people.people_id WHERE poker_player.earnings > 300000
SELECT people.name FROM poker_player JOIN people ON poker_player.people_id = people.people_id WHERE poker_player.earnings > 300000
SELECT people.name FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY poker_player.final_table_made ASC
SELECT people.name FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY poker_player.final_table_made ASC
SELECT people.birth_date FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY poker_player.earnings ASC LIMIT 1
SELECT people.birth_date FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY poker_player.earnings ASC LIMIT 1
SELECT poker_player.money_rank FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY people.height DESC LIMIT 1
SELECT poker_player.money_rank FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY people.height DESC LIMIT 1
SELECT avg(poker_player.earnings) FROM poker_player JOIN people ON poker_player.people_id = people.people_id WHERE people.height > 200
SELECT avg(poker_player.earnings) FROM poker_player JOIN people ON poker_player.people_id = people.people_id WHERE people.height > 200
SELECT people.name FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY poker_player.earnings DESC
SELECT people.name FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY poker_player.earnings DESC
SELECT people.nationality , count(*) FROM people GROUP BY people.nationality
SELECT people.nationality , count(*) FROM people GROUP BY people.nationality
SELECT people.nationality FROM people GROUP BY people.nationality ORDER BY count(*) DESC LIMIT 1
SELECT people.nationality FROM people GROUP BY people.nationality ORDER BY count(*) DESC LIMIT 1
SELECT people.nationality FROM people GROUP BY people.nationality HAVING count(*) >= 2
SELECT people.nationality FROM people GROUP BY people.nationality HAVING count(*) >= 2
SELECT people.name , people.birth_date FROM people ORDER BY people.name ASC
SELECT people.name , people.birth_date FROM people ORDER BY people.name ASC
SELECT people.name FROM people WHERE people.nationality != "Russia"
SELECT people.name FROM people WHERE people.nationality != "Russia"
SELECT people.name FROM people WHERE people.people_id not in ( SELECT poker_player.people_id FROM poker_player )
SELECT people.name FROM people WHERE people.people_id not in ( SELECT poker_player.people_id FROM poker_player )
SELECT count(DISTINCT people.nationality) FROM people
SELECT count(DISTINCT people.nationality) FROM people
SELECT count(*) FROM area_code_state
SELECT contestants.contestant_number , contestants.contestant_name FROM contestants ORDER BY contestants.contestant_name DESC
SELECT votes.vote_id , votes.phone_number , votes.state FROM votes
SELECT max(area_code_state.area_code) , min(area_code_state.area_code) FROM area_code_state
SELECT max(votes.created) FROM votes WHERE votes.state = "CA"
SELECT contestants.contestant_name FROM contestants WHERE contestants.contestant_name != "Jessie Alloway"
SELECT DISTINCT votes.state , votes.created FROM votes
SELECT contestants.contestant_number , contestants.contestant_name FROM contestants JOIN votes ON contestants.contestant_number = votes.contestant_number GROUP BY contestants.contestant_number HAVING count(*) >= 2
SELECT contestants.contestant_number , contestants.contestant_name FROM votes JOIN contestants ON votes.contestant_number = contestants.contestant_number ORDER BY votes.created ASC LIMIT 1
SELECT count(*) FROM votes WHERE votes.state = "NY" OR votes.state = "CA"
SELECT count(*) FROM contestants WHERE contestants.contestant_number not in ( SELECT votes.contestant_number FROM votes )
SELECT area_code_state.area_code FROM votes JOIN area_code_state ON votes.state = area_code_state.state GROUP BY area_code_state.area_code ORDER BY count(*) DESC LIMIT 1
SELECT votes.created , votes.state , votes.phone_number FROM votes JOIN contestants ON votes.contestant_number = contestants.contestant_number WHERE contestants.contestant_name = "Tabatha Gehling"
SELECT area_code_state.area_code FROM votes JOIN contestants ON votes.contestant_number = contestants.contestant_number JOIN area_code_state ON votes.state = area_code_state.state WHERE contestants.contestant_name = "Tabatha Gehling" INTERSECT SELECT area_code_state.area_code FROM votes JOIN contestants ON votes.contestant_number = contestants.contestant_number JOIN area_code_state ON votes.state = area_code_state.state WHERE contestants.contestant_name = "Kelly Clauss"
SELECT contestants.contestant_name FROM contestants WHERE contestants.contestant_name like "%al%"
SELECT country.name FROM country WHERE country.indepyear > 1950
SELECT country.name FROM country WHERE country.indepyear > 1950
SELECT count(*) FROM country WHERE country.governmentform = "Republic"
SELECT count(*) FROM country WHERE country.governmentform = "Republic"
SELECT sum(country.surfacearea) FROM country WHERE country.region = "Caribbean"
SELECT sum(country.surfacearea) FROM country WHERE country.region = "Caribbean"
SELECT country.continent FROM country WHERE country.name = "Anguilla"
SELECT country.continent FROM country WHERE country.name = "Anguilla"
SELECT country.region FROM city JOIN sqlite_sequence JOIN country ON city.countrycode = country.code WHERE city.name = "Kabul"
SELECT country.region FROM city JOIN sqlite_sequence JOIN country ON city.countrycode = country.code WHERE city.name = "Kabul"
SELECT countrylanguage.language FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.name = "Aruba" GROUP BY countrylanguage.language ORDER BY count(*) DESC LIMIT 1
SELECT countrylanguage.language FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.name = "Aruba" GROUP BY countrylanguage.language ORDER BY count(*) DESC LIMIT 1
SELECT country.population , country.lifeexpectancy FROM country WHERE country.name = "Brazil"
SELECT country.population , country.lifeexpectancy FROM country WHERE country.name = "Brazil"
SELECT country.region , country.population FROM country WHERE country.name = "Angola"
SELECT country.region , country.population FROM city JOIN sqlite_sequence JOIN country ON city.countrycode = country.code WHERE country.name = "Angola"
SELECT avg(country.lifeexpectancy) FROM country WHERE country.region = "Central Africa"
SELECT avg(country.lifeexpectancy) FROM country WHERE country.region = "Central Africa"
SELECT country.name FROM country WHERE country.continent = "Asia" ORDER BY country.lifeexpectancy ASC LIMIT 1
SELECT country.name FROM country WHERE country.continent = "Asia" ORDER BY country.lifeexpectancy ASC LIMIT 1
SELECT sum(country.population) , max(country.gnp) FROM country WHERE country.continent = "Asia"
SELECT country.gnp , country.gnp FROM country WHERE country.continent = "Asia" ORDER BY country.gnp DESC LIMIT 1
SELECT avg(country.lifeexpectancy) FROM country WHERE country.continent = "Africa" AND country.governmentform = "Republic"
SELECT avg(country.lifeexpectancy) FROM country WHERE country.continent = "Africa" AND country.governmentform = "Republic"
SELECT sum(country.surfacearea) FROM country WHERE country.continent = "Asia" OR country.continent = "Europe"
SELECT sum(country.surfacearea) FROM country WHERE country.continent = "Asia" OR country.continent = "Europe"
SELECT city.population FROM city WHERE city.district = "Gelderland"
SELECT sum(city.population) FROM city WHERE city.district = "Gelderland"
SELECT avg(country.gnp) , sum(country.population) FROM country WHERE country.governmentform = "US Territory"
SELECT avg(country.gnp) , sum(country.population) FROM country WHERE country.governmentform = "US Territory"
SELECT count(DISTINCT countrylanguage.language) FROM countrylanguage
SELECT count(DISTINCT countrylanguage.language) FROM countrylanguage
SELECT count(DISTINCT country.governmentform) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.continent = "Africa"
SELECT count(DISTINCT country.governmentform) FROM country WHERE country.continent = "Africa"
SELECT count(DISTINCT countrylanguage.language) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.name = "Aruba"
SELECT count(DISTINCT countrylanguage.language) FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE country.name = "Aruba"
SELECT count(DISTINCT countrylanguage.language) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.name = "Afghanistan" AND countrylanguage.isofficial = "T"
SELECT count(DISTINCT countrylanguage.language) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.name = "Afghanistan" AND countrylanguage.isofficial = "T"
SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code GROUP BY country.name ORDER BY count(*) DESC LIMIT 1
SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code GROUP BY country.name ORDER BY count(*) DESC LIMIT 1
SELECT country.continent FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code GROUP BY country.continent ORDER BY count(*) DESC LIMIT 1
SELECT country.continent FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code GROUP BY country.continent ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM countrylanguage WHERE countrylanguage.language = "Dutch" INTERSECT SELECT count(*) FROM countrylanguage WHERE countrylanguage.language = "English"
SELECT count(*) FROM countrylanguage WHERE countrylanguage.language = "Dutch" INTERSECT SELECT count(*) FROM countrylanguage WHERE countrylanguage.language = "English"
SELECT country.name FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = "English" INTERSECT SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "French"
SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "English" INTERSECT SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "French"
SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "English" INTERSECT SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "French"
SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "English" INTERSECT SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "French"
SELECT count(DISTINCT country.continent) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "Chinese"
SELECT count(*) FROM countrylanguage WHERE countrylanguage.language = "Chinese"
SELECT country.region FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = "English" OR countrylanguage.language = "Dutch"
SELECT country.region FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = "Dutch" OR countrylanguage.language = "English"
SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "English" OR countrylanguage.language = "Dutch"
SELECT country.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language = "English" OR countrylanguage.language = "Dutch"
SELECT countrylanguage.language FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.continent = "Asia" GROUP BY countrylanguage.language ORDER BY count(*) DESC LIMIT 1
SELECT countrylanguage.language FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.continent = "Asia" GROUP BY countrylanguage.language ORDER BY count(*) DESC LIMIT 1
SELECT countrylanguage.language FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE country.governmentform = "Republic" GROUP BY countrylanguage.language HAVING count(*) = 1
SELECT countrylanguage.language FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE country.governmentform = "Republic" GROUP BY countrylanguage.language HAVING count(*) = 1
SELECT city.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code JOIN city ON country.code = city.countrycode WHERE city.population = ( SELECT max(city.population) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code JOIN city ON country.code = city.countrycode WHERE countrylanguage.language = "English" ) AND countrylanguage.language = "English"
SELECT city.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code JOIN city ON country.code = city.countrycode WHERE countrylanguage.language = "English" ORDER BY city.population DESC LIMIT 1
SELECT country.name , country.population , country.lifeexpectancy FROM country WHERE country.continent = "Asia" ORDER BY country.surfacearea DESC LIMIT 1
SELECT country.name , country.population , country.lifeexpectancy FROM country WHERE country.continent = "Asia" ORDER BY country.surfacearea DESC LIMIT 1
SELECT avg(country.lifeexpectancy) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language != "English"
SELECT avg(country.lifeexpectancy) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language != "English"
SELECT sum(country.population) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language != "English"
SELECT country.population FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language != "English"
SELECT countrylanguage.language FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE country.headofstate = "Beatrix" AND countrylanguage.isofficial = "T"
SELECT countrylanguage.language FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE country.headofstate = "Beatrix" AND countrylanguage.isofficial = "T"
SELECT count(DISTINCT countrylanguage.language) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.indepyear < 1930 AND countrylanguage.isofficial = "T"
SELECT count(DISTINCT countrylanguage.language) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.indepyear < 1930 AND countrylanguage.isofficial = "T"
SELECT country.name FROM country WHERE country.surfacearea > ( SELECT max(country.surfacearea) FROM country WHERE country.continent = "Europe" )
SELECT country.name FROM country WHERE country.surfacearea > ( SELECT max(country.surfacearea) FROM country WHERE country.continent = "Europe" )
SELECT country.name FROM country WHERE country.continent = "Africa" AND country.population < ( SELECT min(country.population) FROM country WHERE country.continent = "Asia" )
SELECT country.name FROM country WHERE country.continent = "Africa" AND country.population < ( SELECT min(country.population) FROM country WHERE country.continent = "Asia" )
SELECT country.name FROM country WHERE country.population > ( SELECT max(country.population) FROM country WHERE country.continent = "Asia" INTERSECT SELECT max(country.population) FROM country WHERE country.continent = "Africa" )
SELECT country.name FROM country WHERE country.population > ( SELECT max(country.population) FROM country WHERE country.continent = "Asia" INTERSECT SELECT max(country.population) FROM country WHERE country.continent = "Africa" )
SELECT countrylanguage.countrycode FROM countrylanguage WHERE countrylanguage.language != "English"
SELECT countrylanguage.countrycode FROM countrylanguage WHERE countrylanguage.language != "English"
SELECT countrylanguage.countrycode FROM countrylanguage WHERE countrylanguage.language != "English"
SELECT countrylanguage.countrycode FROM countrylanguage WHERE countrylanguage.language != "English"
SELECT countrylanguage.countrycode FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE countrylanguage.language != "English" AND country.governmentform != "Republic"
SELECT countrylanguage.countrycode FROM countrylanguage WHERE countrylanguage.language != "English" EXCEPT SELECT countrylanguage.countrycode FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE country.governmentform = "Republic"
SELECT city.name FROM city JOIN country ON city.countrycode = country.code JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE country.continent = "Europe" AND countrylanguage.language != "English"
SELECT city.name FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code JOIN city ON country.code = city.countrycode WHERE country.continent = "Europe" AND countrylanguage.language != "English"
SELECT count(DISTINCT city.name) FROM countrylanguage JOIN sqlite_sequence JOIN city JOIN country ON city.countrycode = country.code WHERE country.continent = "Asia" AND countrylanguage.language = "Chinese"
SELECT DISTINCT city.name FROM city JOIN country ON city.countrycode = country.code JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE country.continent = "Asia" AND countrylanguage.language = "Chinese"
SELECT country.name , country.indepyear , country.surfacearea FROM country ORDER BY country.population ASC LIMIT 1
SELECT country.name , country.indepyear , country.surfacearea FROM country ORDER BY country.population ASC LIMIT 1
SELECT country.population , country.name , country.headofstate FROM country ORDER BY country.surfacearea DESC LIMIT 1
SELECT country.name , country.population , country.headofstate FROM country ORDER BY country.surfacearea DESC LIMIT 1
SELECT country.name , count(*) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code GROUP BY country.name HAVING count(*) >= 3
SELECT country.name , count(*) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code GROUP BY country.name HAVING count(*) > 2
SELECT count(*) , city.district FROM city WHERE city.population > ( SELECT avg(city.population) FROM city ) GROUP BY city.district
SELECT count(*) , city.district FROM city WHERE city.population > ( SELECT avg(city.population) FROM city ) GROUP BY city.district
SELECT country.governmentform , sum(country.population) FROM country GROUP BY country.governmentform HAVING avg(country.lifeexpectancy) > 72
SELECT sum(country.population) , country.governmentform FROM country GROUP BY country.governmentform HAVING avg(country.lifeexpectancy) > 72
SELECT country.continent , avg(country.population) FROM country GROUP BY country.continent HAVING avg(country.lifeexpectancy) < 72
SELECT country.continent , sum(country.population) FROM country GROUP BY country.continent HAVING avg(country.lifeexpectancy) < 72
SELECT country.name , country.surfacearea FROM country ORDER BY country.surfacearea DESC LIMIT 5
SELECT country.name , country.surfacearea FROM country ORDER BY country.surfacearea DESC LIMIT 5
SELECT country.name FROM country ORDER BY country.population DESC LIMIT 3
SELECT country.name FROM country ORDER BY country.population DESC LIMIT 3
SELECT country.name FROM country ORDER BY country.population ASC LIMIT 3
SELECT country.name FROM country ORDER BY country.population ASC LIMIT 3
SELECT count(*) FROM country WHERE country.continent = "Asia"
SELECT count(*) FROM country WHERE country.continent = "Asia"
SELECT country.name FROM country WHERE country.continent = "Europe" AND country.population = 80000
SELECT country.name FROM country WHERE country.continent = "Europe" AND country.population = 80000
SELECT sum(country.population) , avg(country.surfacearea) FROM country WHERE country.continent = "North America" AND country.surfacearea > 3000
SELECT sum(country.population) , avg(country.surfacearea) FROM country WHERE country.continent = "North America"
SELECT city.name FROM city WHERE city.population between 160000 AND 900000
SELECT city.name FROM city WHERE city.population between 160000 AND 900000
SELECT countrylanguage.language FROM countrylanguage GROUP BY countrylanguage.language ORDER BY count(*) DESC LIMIT 1
SELECT countrylanguage.language FROM countrylanguage GROUP BY countrylanguage.language ORDER BY count(*) DESC LIMIT 1
SELECT country.name , max(countrylanguage.percentage) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code GROUP BY country.name
SELECT countrylanguage.countrycode , count(countrylanguage.language) FROM countrylanguage GROUP BY countrylanguage.countrycode ORDER BY max(countrylanguage.percentage) DESC LIMIT 1
SELECT count(*) FROM countrylanguage WHERE countrylanguage.language = "Spanish" AND countrylanguage.percentage = (SELECT countrylanguage.percentage FROM countrylanguage ORDER BY countrylanguage.percentage DESC LIMIT 1)
SELECT count(*) FROM countrylanguage WHERE countrylanguage.language = "Spanish"
SELECT countrylanguage.countrycode FROM countrylanguage WHERE countrylanguage.language = "Spanish" ORDER BY countrylanguage.percentage DESC LIMIT 1
SELECT countrylanguage.countrycode FROM countrylanguage WHERE countrylanguage.language = "Spanish" GROUP BY countrylanguage.countrycode ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT conductor.name FROM conductor ORDER BY conductor.age ASC
SELECT conductor.name FROM conductor ORDER BY conductor.age ASC
SELECT conductor.name FROM conductor WHERE conductor.nationality != "USA"
SELECT conductor.name FROM conductor WHERE conductor.nationality != "USA"
SELECT orchestra.record_company FROM orchestra ORDER BY orchestra.year_of_founded DESC
SELECT orchestra.record_company FROM orchestra ORDER BY orchestra.year_of_founded DESC
SELECT avg(show.attendance) FROM show
SELECT avg(show.attendance) FROM show
SELECT max(performance.share) , min(performance.share) FROM performance WHERE performance.type != "Live final"
SELECT max(performance.share) , min(performance.share) FROM performance WHERE performance.type != "Live final"
SELECT count(DISTINCT conductor.nationality) FROM conductor
SELECT count(DISTINCT conductor.nationality) FROM conductor
SELECT conductor.name FROM conductor ORDER BY conductor.year_of_work DESC
SELECT conductor.name FROM conductor ORDER BY conductor.year_of_work DESC
SELECT conductor.name FROM conductor ORDER BY conductor.year_of_work DESC LIMIT 1
SELECT conductor.name FROM conductor ORDER BY conductor.year_of_work DESC LIMIT 1
SELECT conductor.name , orchestra.orchestra FROM orchestra JOIN conductor ON orchestra.conductor_id = conductor.conductor_id
SELECT conductor.name , orchestra.orchestra FROM orchestra JOIN conductor ON orchestra.conductor_id = conductor.conductor_id
SELECT conductor.name FROM orchestra JOIN conductor ON orchestra.conductor_id = conductor.conductor_id GROUP BY orchestra.conductor_id HAVING count(*) > 1
SELECT conductor.name FROM orchestra JOIN conductor ON orchestra.conductor_id = conductor.conductor_id GROUP BY orchestra.conductor_id HAVING count(*) > 1
SELECT conductor.name FROM orchestra JOIN conductor ON orchestra.conductor_id = conductor.conductor_id GROUP BY orchestra.conductor_id ORDER BY count(*) DESC LIMIT 1
SELECT conductor.name FROM orchestra JOIN conductor ON orchestra.conductor_id = conductor.conductor_id GROUP BY orchestra.conductor_id ORDER BY count(*) DESC LIMIT 1
SELECT conductor.name FROM orchestra JOIN conductor ON orchestra.conductor_id = conductor.conductor_id WHERE orchestra.year_of_founded > 2008
SELECT conductor.name FROM orchestra JOIN conductor ON orchestra.conductor_id = conductor.conductor_id WHERE orchestra.year_of_founded > 2008
SELECT orchestra.record_company , count(*) FROM orchestra GROUP BY orchestra.record_company
SELECT orchestra.record_company , count(*) FROM orchestra GROUP BY orchestra.record_company
SELECT orchestra.major_record_format FROM orchestra GROUP BY orchestra.major_record_format ORDER BY count(*) ASC
SELECT orchestra.major_record_format FROM orchestra GROUP BY orchestra.major_record_format ORDER BY count(*) ASC
SELECT orchestra.record_company FROM orchestra GROUP BY orchestra.record_company ORDER BY count(*) DESC LIMIT 1
SELECT orchestra.record_company FROM orchestra GROUP BY orchestra.record_company ORDER BY count(*) DESC LIMIT 1
SELECT orchestra.orchestra FROM orchestra WHERE orchestra.orchestra_id not in ( SELECT performance.orchestra_id FROM performance )
SELECT orchestra.orchestra FROM orchestra WHERE orchestra.orchestra_id not in ( SELECT performance.orchestra_id FROM performance )
SELECT orchestra.record_company FROM orchestra WHERE orchestra.year_of_founded < 2003 INTERSECT SELECT orchestra.record_company FROM orchestra WHERE orchestra.year_of_founded > 2003
SELECT orchestra.record_company FROM orchestra WHERE orchestra.year_of_founded < 2003 INTERSECT SELECT orchestra.record_company FROM orchestra WHERE orchestra.year_of_founded > 2003
SELECT count(*) FROM orchestra WHERE orchestra.major_record_format = "CD" OR orchestra.major_record_format = "DVD"
SELECT count(*) FROM orchestra WHERE orchestra.major_record_format = "CD" OR orchestra.major_record_format = "DVD"
SELECT orchestra.year_of_founded FROM performance JOIN orchestra ON performance.orchestra_id = orchestra.orchestra_id GROUP BY orchestra.year_of_founded HAVING count(*) > 1
SELECT orchestra.year_of_founded FROM performance JOIN orchestra ON performance.orchestra_id = orchestra.orchestra_id GROUP BY performance.orchestra_id HAVING count(*) > 1
SELECT count(*) FROM highschooler
SELECT count(*) FROM highschooler
SELECT highschooler.name , highschooler.grade FROM highschooler
SELECT highschooler.name , highschooler.grade FROM highschooler
SELECT DISTINCT highschooler.grade FROM highschooler
SELECT highschooler.grade FROM highschooler
SELECT highschooler.grade FROM highschooler WHERE highschooler.name = "Kyle"
SELECT highschooler.grade FROM highschooler WHERE highschooler.name = "Kyle"
SELECT highschooler.name FROM highschooler WHERE highschooler.grade = 10
SELECT highschooler.name FROM highschooler WHERE highschooler.grade = 10
SELECT highschooler.id FROM highschooler WHERE highschooler.name = "Kyle"
SELECT highschooler.id FROM highschooler JOIN friend ON highschooler.id = friend.student_id WHERE highschooler.name = "Kyle"
SELECT count(*) FROM highschooler WHERE highschooler.grade = 9 OR highschooler.grade = 10
SELECT count(*) FROM highschooler WHERE highschooler.grade = 9 OR highschooler.grade = 10
SELECT count(*) , highschooler.grade FROM highschooler GROUP BY highschooler.grade
SELECT count(*) , highschooler.grade FROM highschooler GROUP BY highschooler.grade
SELECT highschooler.grade FROM highschooler GROUP BY highschooler.grade ORDER BY count(*) DESC LIMIT 1
SELECT highschooler.grade FROM highschooler GROUP BY highschooler.grade ORDER BY count(*) DESC LIMIT 1
SELECT highschooler.grade FROM highschooler GROUP BY highschooler.grade HAVING count(*) >= 4
SELECT highschooler.grade FROM highschooler GROUP BY highschooler.grade HAVING count(*) >= 4
SELECT friend.student_id , count(*) FROM friend GROUP BY friend.student_id
SELECT count(*) FROM friend
SELECT highschooler.name , count(*) FROM highschooler JOIN friend ON highschooler.id = friend.student_id GROUP BY highschooler.name
SELECT highschooler.name , count(*) FROM highschooler JOIN friend ON highschooler.id = friend.student_id GROUP BY highschooler.name
SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id GROUP BY friend.student_id ORDER BY count(*) DESC LIMIT 1
SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id GROUP BY friend.student_id ORDER BY count(*) DESC LIMIT 1
SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id GROUP BY highschooler.id HAVING count(*) >= 3
SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id GROUP BY highschooler.id HAVING count(*) >= 3
SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id WHERE highschooler.name = "Kyle"
SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id WHERE highschooler.name = "Kyle"
SELECT count(*) FROM highschooler JOIN friend ON highschooler.id = friend.student_id WHERE highschooler.name = "Kyle"
SELECT count(*) FROM highschooler JOIN friend ON highschooler.id = friend.student_id WHERE highschooler.name = "Kyle"
SELECT highschooler.id FROM highschooler EXCEPT SELECT friend.student_id FROM friend
SELECT highschooler.id FROM highschooler EXCEPT SELECT friend.student_id FROM friend
SELECT highschooler.name FROM highschooler WHERE highschooler.id not in ( SELECT friend.student_id FROM friend )
SELECT highschooler.name FROM highschooler EXCEPT SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id
SELECT friend.student_id FROM friend INTERSECT SELECT likes.student_id FROM likes
SELECT friend.student_id FROM friend INTERSECT SELECT likes.student_id FROM likes
SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id INTERSECT SELECT highschooler.name FROM likes JOIN highschooler ON likes.student_id = highschooler.id JOIN friend ON highschooler.id = friend.student_id
SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id INTERSECT SELECT highschooler.name FROM highschooler JOIN likes ON highschooler.id = likes.liked_id
SELECT count(*) , likes.student_id FROM likes GROUP BY likes.student_id
SELECT count(*) , likes.student_id FROM likes GROUP BY likes.student_id
SELECT highschooler.name , count(*) FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY highschooler.name
SELECT highschooler.name , count(*) FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY highschooler.name
SELECT highschooler.name FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY likes.student_id ORDER BY count(*) DESC LIMIT 1
SELECT highschooler.name FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY likes.student_id ORDER BY count(*) DESC LIMIT 1
SELECT highschooler.name FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY likes.student_id HAVING count(*) >= 2
SELECT highschooler.name FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY likes.student_id HAVING count(*) >= 2
SELECT highschooler.name FROM highschooler WHERE highschooler.grade > 5 INTERSECT SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id GROUP BY friend.student_id HAVING count(*) >= 2
SELECT highschooler.name FROM highschooler WHERE highschooler.grade > 5 INTERSECT SELECT highschooler.name FROM highschooler JOIN friend ON highschooler.id = friend.student_id GROUP BY highschooler.id HAVING count(*) >= 2
SELECT count(*) FROM highschooler JOIN likes ON highschooler.id = likes.student_id WHERE highschooler.name = "Kyle"
SELECT count(*) FROM highschooler JOIN likes ON highschooler.id = likes.student_id WHERE highschooler.name = "Kyle"
SELECT avg(highschooler.grade) FROM highschooler WHERE highschooler.id in ( SELECT likes.student_id FROM likes )
SELECT avg(highschooler.grade) FROM highschooler WHERE highschooler.id in ( SELECT friend.student_id FROM friend )
SELECT min(highschooler.grade) FROM highschooler WHERE highschooler.id not in ( SELECT friend.student_id FROM friend )
SELECT min(highschooler.grade) FROM highschooler WHERE highschooler.id not in ( SELECT friend.student_id FROM friend )
SELECT owners.state FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN treatments ON dogs.dog_id = treatments.dog_id INTERSECT SELECT owners.state FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN treatments ON dogs.dog_id = treatments.dog_id
SELECT owners.state FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN treatments ON dogs.dog_id = treatments.dog_id INTERSECT SELECT owners.state FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN treatments ON dogs.dog_id = treatments.dog_id
SELECT avg(dogs.age) FROM treatments JOIN dogs ON treatments.dog_id = dogs.dog_id 
SELECT avg(dogs.age) FROM treatments JOIN dogs ON treatments.dog_id = dogs.dog_id
SELECT professionals.professional_id , professionals.last_name , professionals.cell_number FROM professionals JOIN treatments ON professionals.professional_id = treatments.professional_id WHERE professionals.state = "Indiana" UNION SELECT treatments.professional_id , professionals.last_name , professionals.cell_number FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id GROUP BY treatments.professional_id HAVING count(*) > 2 
SELECT professionals.professional_id , professionals.last_name , professionals.cell_number FROM professionals WHERE professionals.state = "Indiana" UNION SELECT treatments.professional_id , professionals.last_name , professionals.cell_number FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id GROUP BY treatments.professional_id HAVING count(*) > 2 
SELECT dogs.name FROM dogs EXCEPT SELECT dogs.name FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id WHERE treatments.cost_of_treatment > 1000
SELECT dogs.name FROM dogs EXCEPT SELECT dogs.name FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id HAVING max(treatments.cost_of_treatment) > 1000
SELECT professionals.first_name FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id EXCEPT SELECT owners.first_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id
SELECT professionals.first_name FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id EXCEPT SELECT owners.first_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id
SELECT professionals.professional_id , professionals.role_code , professionals.email_address FROM professionals WHERE professionals.professional_id not in ( SELECT treatments.professional_id FROM treatments )
SELECT professionals.professional_id , professionals.role_code , professionals.email_address FROM professionals WHERE professionals.professional_id not in ( SELECT treatments.professional_id FROM treatments )
SELECT owners.owner_id , owners.first_name , owners.last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id GROUP BY owners.owner_id ORDER BY count(*) DESC LIMIT 1
SELECT owners.owner_id , owners.first_name , owners.last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id GROUP BY owners.owner_id ORDER BY count(*) DESC LIMIT 1
SELECT treatments.professional_id , professionals.role_code , professionals.first_name FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id GROUP BY treatments.professional_id HAVING count(*) >= 2
SELECT professionals.professional_id , professionals.role_code , professionals.first_name FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id GROUP BY professionals.professional_id HAVING count(*) >= 2
SELECT breeds.breed_name FROM dogs JOIN breeds ON dogs.breed_code = breeds.breed_code GROUP BY dogs.breed_code ORDER BY count(*) DESC LIMIT 1
SELECT breeds.breed_name FROM dogs JOIN breeds ON dogs.breed_code = breeds.breed_code GROUP BY dogs.breed_code ORDER BY count(*) DESC LIMIT 1
SELECT owners.owner_id , owners.last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN charges ON dogs.dog_id = charges.charge_id JOIN treatments ON dogs.dog_id = treatments.dog_id GROUP BY owners.owner_id ORDER BY sum(treatments.cost_of_treatment) DESC LIMIT 1
SELECT owners.owner_id , owners.last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN treatments ON dogs.dog_id = treatments.dog_id GROUP BY owners.owner_id ORDER BY sum(treatments.cost_of_treatment) DESC LIMIT 1
SELECT treatment_types.treatment_type_description FROM treatment_types JOIN treatments ON treatment_types.treatment_type_code = treatments.treatment_type_code GROUP BY treatment_types.treatment_type_code ORDER BY sum(treatments.cost_of_treatment) ASC LIMIT 1
SELECT treatment_types.treatment_type_description FROM treatment_types JOIN treatments ON treatment_types.treatment_type_code = treatments.treatment_type_code GROUP BY treatment_types.treatment_type_code ORDER BY sum(treatments.cost_of_treatment) ASC LIMIT 1
SELECT owners.owner_id , owners.zip_code FROM charges JOIN dogs ON charges.charge_id = dogs.dog_id JOIN owners ON dogs.owner_id = owners.owner_id GROUP BY owners.owner_id ORDER BY sum(charges.charge_amount) DESC LIMIT 1
SELECT owners.owner_id , owners.zip_code FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN charges ON dogs.dog_id = charges.charge_id GROUP BY owners.owner_id ORDER BY sum(charges.charge_amount) DESC LIMIT 1
SELECT treatments.professional_id , professionals.cell_number FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id GROUP BY treatments.professional_id HAVING count(*) >= 2
SELECT treatments.professional_id , professionals.cell_number FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id GROUP BY treatments.professional_id HAVING count(*) >= 2
SELECT professionals.first_name , professionals.last_name FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id WHERE treatments.cost_of_treatment < ( SELECT avg(treatments.cost_of_treatment) FROM treatments )
SELECT professionals.first_name , professionals.last_name FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id WHERE treatments.cost_of_treatment < ( SELECT avg(treatments.cost_of_treatment) FROM treatments )
SELECT treatments.date_of_treatment , professionals.first_name FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id
SELECT treatments.date_of_treatment , professionals.first_name FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id
SELECT treatments.cost_of_treatment , treatment_types.treatment_type_description FROM treatments JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT treatments.cost_of_treatment , treatment_types.treatment_type_description FROM treatments JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT owners.first_name , owners.last_name , dogs.size_code FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id
SELECT owners.first_name , owners.last_name , dogs.size_code FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id
SELECT owners.first_name , dogs.name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id
SELECT owners.first_name , dogs.name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id
SELECT dogs.name , treatments.date_of_treatment FROM treatments JOIN dogs ON treatments.dog_id = dogs.dog_id ORDER BY dogs.breed_code ASC LIMIT 1
SELECT dogs.name , treatments.date_of_treatment FROM treatments JOIN dogs ON treatments.dog_id = dogs.dog_id GROUP BY dogs.dog_id ORDER BY count(*) ASC LIMIT 1
SELECT owners.first_name , dogs.name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id WHERE owners.state = "Virginia"
SELECT owners.first_name , dogs.name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id WHERE owners.state = "Virginia"
SELECT dogs.date_arrived , dogs.date_departed FROM treatments JOIN dogs ON treatments.dog_id = dogs.dog_id
SELECT dogs.date_arrived , dogs.date_departed FROM treatments JOIN dogs ON treatments.dog_id = dogs.dog_id
SELECT owners.last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id ORDER BY dogs.date_of_birth ASC LIMIT 1
SELECT owners.last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id ORDER BY dogs.date_of_birth ASC LIMIT 1
SELECT professionals.email_address FROM professionals WHERE professionals.state = "Hawaii" OR professionals.state = "Wisconsin"
SELECT professionals.email_address FROM professionals WHERE professionals.state = "Hawaii" OR professionals.state = "Wisconsin"
SELECT dogs.date_arrived , dogs.date_departed FROM dogs
SELECT dogs.date_arrived , dogs.date_departed FROM dogs
SELECT count(DISTINCT treatments.dog_id) FROM treatments
SELECT count(DISTINCT treatments.dog_id) FROM treatments
SELECT count(DISTINCT treatments.professional_id) FROM treatments
SELECT count(DISTINCT professionals.professional_id) FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id
SELECT professionals.role_code , professionals.street , professionals.city , professionals.state FROM professionals WHERE professionals.city like "%west%"
SELECT professionals.role_code , professionals.street , professionals.city , professionals.state FROM professionals WHERE professionals.city like "%west%"
SELECT owners.first_name , owners.last_name , owners.email_address FROM owners WHERE owners.state like "%north%"
SELECT owners.first_name , owners.last_name , owners.email_address FROM owners WHERE owners.state like "%north%"
SELECT count(*) FROM dogs WHERE dogs.age < ( SELECT avg(dogs.age) FROM dogs )
SELECT count(*) FROM dogs WHERE dogs.age < ( SELECT avg(dogs.age) FROM dogs )
SELECT treatments.cost_of_treatment FROM treatments ORDER BY treatments.date_of_treatment DESC LIMIT 1
SELECT treatments.cost_of_treatment FROM treatments ORDER BY treatments.date_of_treatment ASC LIMIT 1
SELECT count(*) FROM dogs WHERE dogs.dog_id not in ( SELECT treatments.dog_id FROM treatments )
SELECT count(*) FROM dogs WHERE dogs.dog_id not in ( SELECT treatments.dog_id FROM treatments )
SELECT count(*) FROM owners WHERE owners.owner_id not in ( SELECT dogs.owner_id FROM dogs )
SELECT count(*) FROM owners WHERE owners.owner_id not in ( SELECT dogs.owner_id FROM dogs )
SELECT count(*) FROM professionals WHERE professionals.professional_id not in ( SELECT treatments.professional_id FROM treatments )
SELECT count(*) FROM professionals WHERE professionals.professional_id not in ( SELECT treatments.professional_id FROM treatments )
SELECT dogs.name , dogs.age , dogs.weight FROM dogs WHERE dogs.abandoned_yn = 1
SELECT dogs.name , dogs.age , dogs.weight FROM dogs WHERE dogs.abandoned_yn = 1
SELECT avg(dogs.age) FROM dogs
SELECT avg(dogs.age) FROM dogs
SELECT max(dogs.age) FROM dogs
SELECT max(dogs.age) FROM dogs
SELECT charges.charge_type , charges.charge_amount FROM charges
SELECT charges.charge_type , charges.charge_amount FROM charges
SELECT charges.charge_amount FROM charges JOIN treatments ON charges.charge_id = treatments.treatment_id ORDER BY treatments.cost_of_treatment DESC LIMIT 1
SELECT max(charges.charge_amount) FROM charges
SELECT professionals.email_address , professionals.cell_number , professionals.home_phone FROM professionals
SELECT professionals.email_address , professionals.cell_number , professionals.home_phone FROM professionals
SELECT DISTINCT breeds.breed_name , sizes.size_code FROM breeds JOIN dogs ON breeds.breed_code = dogs.breed_code JOIN sizes ON dogs.size_code = sizes.size_code
SELECT DISTINCT breeds.breed_name , dogs.size_code FROM dogs JOIN breeds ON dogs.breed_code = breeds.breed_code
SELECT professionals.first_name , treatment_types.treatment_type_description FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT professionals.first_name , treatment_types.treatment_type_description FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT singer.name FROM singer ORDER BY singer.net_worth_millions ASC
SELECT singer.name FROM singer ORDER BY singer.net_worth_millions ASC
SELECT singer.birth_year , singer.citizenship FROM singer
SELECT singer.birth_year , singer.citizenship FROM singer
SELECT singer.name FROM singer WHERE singer.citizenship != "France"
SELECT singer.name FROM singer WHERE singer.citizenship != "France"
SELECT singer.name FROM singer WHERE singer.birth_year = 1948 OR singer.birth_year = 1949
SELECT singer.name FROM singer WHERE singer.birth_year = 1948 OR singer.birth_year = 1949
SELECT singer.name FROM singer ORDER BY singer.net_worth_millions DESC LIMIT 1
SELECT singer.name FROM singer ORDER BY singer.net_worth_millions DESC LIMIT 1
SELECT singer.citizenship , count(*) FROM singer GROUP BY singer.citizenship
SELECT singer.citizenship , count(*) FROM singer GROUP BY singer.citizenship
SELECT singer.citizenship FROM singer GROUP BY singer.citizenship ORDER BY count(*) DESC LIMIT 1
SELECT singer.citizenship FROM singer GROUP BY singer.citizenship ORDER BY count(*) DESC LIMIT 1
SELECT singer.citizenship , max(singer.net_worth_millions) FROM singer GROUP BY singer.citizenship
SELECT max(singer.net_worth_millions) , singer.citizenship FROM singer GROUP BY singer.citizenship
SELECT song.title , singer.name FROM singer JOIN song ON singer.singer_id = song.singer_id
SELECT song.title , singer.name FROM singer JOIN song ON singer.singer_id = song.singer_id
SELECT DISTINCT singer.name FROM singer JOIN song ON singer.singer_id = song.singer_id WHERE song.sales > 300000
SELECT DISTINCT singer.name FROM singer JOIN song ON singer.singer_id = song.singer_id WHERE song.sales > 300000
SELECT singer.name FROM song JOIN singer ON song.singer_id = singer.singer_id GROUP BY song.singer_id HAVING count(*) > 1
SELECT singer.name FROM song JOIN singer ON song.singer_id = singer.singer_id GROUP BY song.singer_id HAVING count(*) > 1
SELECT singer.name , sum(song.sales) FROM song JOIN singer ON song.singer_id = singer.singer_id GROUP BY singer.name
SELECT sum(song.sales) , singer.name FROM singer JOIN song ON singer.singer_id = song.singer_id GROUP BY singer.name
SELECT singer.name FROM singer WHERE singer.singer_id not in ( SELECT song.singer_id FROM song )
SELECT singer.name FROM singer WHERE singer.singer_id not in ( SELECT song.singer_id FROM song )
SELECT singer.citizenship FROM singer WHERE singer.birth_year < 1945 INTERSECT SELECT singer.citizenship FROM singer WHERE singer.birth_year > 1955
SELECT singer.citizenship FROM singer WHERE singer.birth_year < 1945 INTERSECT SELECT singer.citizenship FROM singer WHERE singer.birth_year > 1955
SELECT count(*) FROM other_available_features
SELECT ref_feature_types.feature_type_name FROM other_available_features JOIN ref_feature_types ON other_available_features.feature_type_code = ref_feature_types.feature_type_code WHERE other_available_features.feature_name = "AirCon"
SELECT ref_property_types.property_type_description FROM ref_property_types
SELECT properties.property_name FROM properties WHERE properties.property_type_code = "House" OR properties.room_count > 1 AND properties.property_type_code = "Apartment"