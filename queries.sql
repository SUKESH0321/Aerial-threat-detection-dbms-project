
INSERT INTO Aerial_Objects(type, speed, altitude)
VALUES ('Missile', 1000, 4000);

INSERT INTO Threat_Assessment(object_id, threat_level)
SELECT object_id,
    CASE
        WHEN type = 'Missile' THEN 'CRITICAL'
        WHEN speed > 800 THEN 'HIGH'
        WHEN speed > 400 THEN 'MEDIUM'
        ELSE 'LOW'
    END
FROM Aerial_Objects
WHERE object_id = 1;

SELECT * FROM Threat_Assessment;
SELECT * FROM Alerts;