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
        'lastname': 'Login',
        'email': 'testerlogin@getgeeks.com',
        'password': 'pwd123'
    }

    return user


def factory_user_be_geek():
    user = {
        'name': 'Tester',
        'lastname': 'Geek',
        'email': 'testergeek@getgeeks.com',
        'password': 'pwd123',
        'geek_profile': {
            'whatsapp': '13999999999',
            'description': 'Desenvolvedor Fullstack',
            'printer_repair': 'Não',
            'work_mode': 'Remoto',
            'cost': '650'
        }
    }

    return user
