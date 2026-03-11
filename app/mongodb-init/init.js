// switch to database
db = db.getSiblingDB("demo");

// create application user
db.createUser({
  user: "appuser",
  pwd: "apppassword",
  roles: [
    {
      role: "readWrite",
      db: "demo"
    }
  ]
});

// insert dummy data
db.users.insertMany([
  {
    type: "fullname",
    value: "Krishan Sorout"
  },
  {
    type: "location",
    value: "Bangalore"
  },
  {
    type: "marital",
    value: "Single"
  }
]);

print("Database initialized with user and dummy data");