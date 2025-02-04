# Flask-Boostrap-Starter-Kit
This is a flask bootstrap starter kit I use for spinning up static sites using bootstrap very quickly. 

Here's how to get started:

1. Clone the repo
1. Make the two scripts executable `chmod +x setup-env.sh db-setup.sh`
1. Run the `./setup-env.sh` script and then the `./db-setup.sh` script to create a database and update the `.env` file with the correct credentials.
1. Set up a virtual environment and install the requirements (`virtualenv v-env` `source v-env/bin/activate` `pip install -r requirements.txt`)
1. Build your HTML pages using Bootstrap + Jinja and place in `/app/templates/`
1. Set up your database models in your db: `flask db init` `flask db migrate` `flask db upgrade`
1. Run your server `flask run`
1. Start making cool stuff!