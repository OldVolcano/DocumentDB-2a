#!/bin/bash

# Required envvars:
# DBNAME - database name
# MASTER_USER - master username
# DBHOST - hostname
# DBPASSWORD - master password
# DBS_ADMIN_PWD - dbs_admin password
# APP_PWD - {DBNAME}_app password
# BI_PWD - {DBNAME}_bi password
# RO_PWD - {DBNAME}_ro password
# DMS_PWD - {DBNAME}_dms password

tmp_log=$(mktemp /tmp/tmp_log.XXXXXX)

exit_code=0
trap "rm -f $tmp_log rds-combined-ca-bundle.pem; exit" 0 2 3 15

echo "Downloading AWS TLS public key"
wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem

echo "Configuring users"

mongosh --tls --host "$DBHOST" --tlsAllowInvalidHostnames --tlsCAFile rds-combined-ca-bundle.pem  --username "$MASTER_USER" --password "$DBPASSWORD" 2>&1 <<EOF | tee "$tmp_log"

// Create dbs_admin user for Database Services supportability
userFound = db.runCommand({ usersInfo: { user: "dbs_admin", db: "admin" } }).users.length == 1;

if (userFound === false) {
  print ("Creating dbs_admin user...");
  try {
    db.createUser({user: "dbs_admin", pwd: "`echo ${DBS_ADMIN_PWD}`", roles: [{"db": "admin", "role": "root"}]});
  }
  catch (err) {
    print ("ERROR: unable to create dbs_admin user");
    print (err);
  }
} else {
  print ("User dbs_admin already exists...skipping");
}

// Create application user 
userFound = db.runCommand({ usersInfo: { user: "${DBNAME}_app", db: "admin" } }).users.length == 1;

if (userFound == false) {
  print ("Creating ${DBNAME}_app user...");
  try {
    db.createUser({user: "${DBNAME}_app", pwd: "`echo ${APP_PWD}`", roles: [{"db": "${DBNAME}", "role": "readWrite"}]});
  }
  catch (err) {
    print ("ERROR: unable to create ${DBNAME}_app user");
    print (err);
  }
} else {
  print ("User ${DBNAME}_app already exists...skipping");
}

// Create BI user 
userFound = db.runCommand({ usersInfo: { user: "${DBNAME}_bi", db: "admin" } }).users.length == 1;

if (userFound == false) {
  print ("Creating ${DBNAME}_bi user...");
  try {
    db.createUser({user: "${DBNAME}_bi", pwd: "`echo ${BI_PWD}`", roles: [{"db": "${DBNAME}", "role": "read"}]});
  }
  catch (err) {
    print ("ERROR: unable to create ${DBNAME}_bi user");
    print (err);
  }
} else {
  print ("User ${DBNAME}_bi already exists...skipping");
}

// Create readonly user 
userFound = db.runCommand({ usersInfo: { user: "${DBNAME}_ro", db: "admin" } }).users.length == 1;

if (userFound == false) {
  print ("Creating ${DBNAME}_ro user...");
  try {
    db.createUser({user: "${DBNAME}_ro", pwd: "`echo ${RO_PWD}`", roles: [{"db": "${DBNAME}", "role": "read"}]});
  }
  catch (err) {
    print ("ERROR: unable to create ${DBNAME}_ro user");
    print (err);
  }
} else {
  print ("User ${DBNAME}_ro already exists...skipping");
}

// Create DMS user 
userFound = db.runCommand({ usersInfo: { user: "${DBNAME}_dms", db: "admin" } }).users.length == 1;

if (userFound == false) {
  print ("Creating ${DBNAME}_dms user...");
  try {
    db.createUser({user: "${DBNAME}_dms", pwd: "`echo ${DMS_PWD}`", roles: [{"db": "${DBNAME}", "role": "readWrite"}]});
  }
  catch (err) {
    print ("ERROR: unable to create ${DBNAME}_dms user");
    print (err);
  }
} else {
  print ("User ${DBNAME}_dms already exists...skipping");
}

EOF

if [[ $(grep -i -e 'ERROR: ' "$tmp_log") ]]; then
  exit_code=1
  cat $tmp_log
  echo "Error encountered while running baseline script!"
  exit $exit_code
fi

echo "...done"
echo "Completed baseline!"

exit $exit_code
