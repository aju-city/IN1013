
-- Part 1: Insert a new event for Fluffy
INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');
    

-- Part 2: Insert Hammy into petPet and then record an event for Hammy
INSERT INTO petPet (petname, owner, species, gender, birth, death) 
VALUES ('Hammy', 'Diane', 'M', 'hamster', '2010-10-30', NULL);

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- Part 3: Additional Events
-- 3. Fluffy had 5 kittens (2 male, 3 female) - changing date to avoid conflict
INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Fluffy', '1995-06-01', 'litter', '5 kittens, 2 male, 3 female');  -- Change date

-- 4. Claws broke a rib
INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Claws', '1997-08-03', 'vet', 'broke rib');

-- 5. Puffball died on 2020-09-01
UPDATE petPet 
SET death = '2020-09-01' 
WHERE petname = 'Puffball';

-- Remove Buffy (dog) due to GDPR where owner is Harold
DELETE FROM petEvent 
WHERE petname = 'Buffy';

DELETE FROM petPet 
WHERE owner = 'Harold' AND gender = 'dog';
