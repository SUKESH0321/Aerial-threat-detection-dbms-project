from flask import Flask, render_template, request, redirect
import sqlite3

app = Flask(__name__)


def get_conn():
    return sqlite3.connect("database.db")


def setup_database():
    conn = sqlite3.connect("database.db")
    cur = conn.cursor()

    with open("db/setup.sql", "r", encoding="utf-8") as f:
        cur.executescript(f.read())

    conn.commit()
    conn.close()


@app.route("/")
def index():
    conn = get_conn()
    cur = conn.cursor()

    alerts = cur.execute("SELECT * FROM Alerts ORDER BY created_at DESC").fetchall()
    threats = cur.execute("SELECT * FROM Threat_Assessment ORDER BY assessed_at DESC").fetchall()

    conn.close()

    return render_template("index.html", alerts=alerts, threats=threats)


@app.route("/add", methods=["POST"])
def add():
    obj_type = request.form["type"]
    speed = int(request.form["speed"])
    altitude = int(request.form["altitude"])

    conn = get_conn()
    cur = conn.cursor()

    cur.execute("""
    INSERT INTO Aerial_Objects (type, speed, altitude)
    VALUES (?, ?, ?)
    """, (obj_type, speed, altitude))

    conn.commit()
    conn.close()

    return redirect("/")


if __name__ == "__main__":
    setup_database()
    app.run(debug=True)