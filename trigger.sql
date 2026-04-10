CREATE TRIGGER threat_alert_trigger
AFTER INSERT ON Threat_Assessment
BEGIN
    INSERT INTO Alerts(object_id, message)
    SELECT NEW.object_id, 'High threat detected!'
    WHERE NEW.threat_level IN ('HIGH', 'CRITICAL');
END;