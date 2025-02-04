import os
from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))

class Config(object):
	SERVER_MODE = os.environ.get('SERVER_MODE') or 'development'
	PORT = int(os.environ.get("PORT", 5000))
	SQLALCHEMY_DATABASE_URI = 'mysql+mysqlconnector://'+os.environ.get('DATABASE_USER')+':'+os.environ.get('DATABASE_PASSWORD')+'@localhost/'+os.environ.get('DATABASE_NAME')+'?auth_plugin=mysql_native_password'

	# Filepath
	FILEPATH = basedir