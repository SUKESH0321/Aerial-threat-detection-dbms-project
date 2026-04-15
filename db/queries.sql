-- View for dashboard
CREATE VIEW IF NOT EXISTS Threat_Dashboard AS
SELECT 
    A.object_id,
    A.type,
    A.speed,
    A.altitude,
    T.threat_level,
    T.priority_score
FROM Aerial_Objects A
JOIN Threat_Assessment T ON A.object_id = T.object_id;

-- High threats
SELECT * FROM Threat_Dashboard
WHERE threat_level IN ('CRITICAL', 'HIGH');

-- Stats
SELECT threat_level, COUNT(*) 
FROM Threat_Assessment
GROUP BY threat_level;