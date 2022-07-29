import bcrypt

from faker import Faker
fake = Faker()


def get_hashed_password(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def factory_user():
    user = {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': 'pwd123'
    }

    return user


def factory_wrong_email():
    name = fake.first_name()

    user = {
        'name': name,
        'lastname': fake.last_name(),
        'email': name.lower() + '&email.com',
        'password': 'pwd123'
    }

    return user


def factory_user_login():
    user = {
        'name': 'Tester',
        'lastname': 'Getgeeks',
        'email': 'tester@getgeeks.com',
        'password': 'pwd123'
    }

    return user
