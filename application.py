from app import create_app
import datetime

application = create_app()

# Jinja Functions -- this is an example of how to define Python functions accessible inline in Jinja templates
def now(strftime_req): 
	now = datetime.datetime.now()
	return now.strftime(strftime_req)

application.jinja_env.globals.update(now=now)