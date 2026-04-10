CREATE TABLE Aerial_Objects (
    object_id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    speed INTEGER,
    altitude INTEGER,
    detected_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Threat_Assessment (
    assessment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    object_id INTEGER,
    threat_level TEXT,
    assessed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Alerts (
    alert_id INTEGER PRIMARY KEY AUTOINCREMENT,
    object_id INTEGER,
    message TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);