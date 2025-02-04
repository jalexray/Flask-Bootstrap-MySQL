from flask import render_template, url_for, request, current_app
from app.main import bp
from utilities import utilities

from app import db
from app.models import User

@bp.route('/', methods=['GET', 'POST'])
def index():
	return render_template('index.html', title='Page Title')

@bp.route('/favicon.ico')
def favicon():
	return current_app.send_static_file("images/favicon.ico")

