import datetime

class User:
  def __init__(self, id, name, gender, birth, email):
    self._id = id
    self._name = name
    self._gender = gender
    self._birth = birth # datetime.date(1990, 5, 15)
    self._email = email
  
  def get_age(self):
    today = datetime.date.today()
    age = today.year - self._birth.year - ((today.month, today.day) < (self._birth.month, self._birth.day))
    return age