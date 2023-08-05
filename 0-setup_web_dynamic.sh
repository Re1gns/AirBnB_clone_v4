#!/bin/bash

# Step 1: Create the web_dynamic directory if it doesn't exist
mkdir -p web_dynamic

# Step 2: Copy the files and folders to the web_dynamic folder
cp -r web_flask/static web_flask/templates/100-hbnb.html web_flask/__init__.py web_flask/100-hbnb.py web_dynamic/

# Step 3: Rename 100-hbnb.py to 0-hbnb.py
mv web_dynamic/100-hbnb.py web_dynamic/0-hbnb.py

# Step 4: Rename 100-hbnb.html to 0-hbnb.html
mv web_dynamic/100-hbnb.html web_dynamic/0-hbnb.html

# Step 5: Update 0-hbnb.py to replace the existing route to /0-hbnb/
sed -i 's@app.route("/100-hbnb/")@app.route("/0-hbnb/")@g' web_dynamic/0-hbnb.py

# Step 6: Set the environment variables to resolve the encoding issue
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Step 7: Start the Flask web application
export FLASK_APP=web_dynamic/0-hbnb.py
flask run
