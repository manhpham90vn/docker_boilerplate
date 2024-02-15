# tạo mới một venv
python -m venv .env

# active env
source .env/bin/activate

# install module
pip install requests

# export requirements.txt
pip freeze > requirements.txt

# https://docs.python.org/3/library/venv.html