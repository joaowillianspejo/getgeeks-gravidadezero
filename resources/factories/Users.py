import bcrypt

from faker import Faker
fake = Faker()


def get_hashed_password(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def factory_user(target):
    name = fake.first_name()

    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'pwd123'
        },

        'wrong_email': {
            'name': name,
            'lastname': fake.last_name(),
            'email': name.lower() + '&email.com',
            'password': 'pwd123'
        },

        'login': {
            'name': 'Tester',
            'lastname': 'Login',
            'email': 'testerlogin@getgeeks.com',
            'password': 'pwd123'
        },

        'be_geek': {
            'name': 'Tester',
            'lastname': 'Geek',
            'email': 'testergeek@getgeeks.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '13999999999',
                'description': 'Desenvolvedor Fullstack, especialista em desenvolvimento web com React e APIs rest em Node.js, também desenvolvo Apps Mobile com React Native e desenvolvo testes automatizados com Cypress e Robot Framework.',
                'printer_repair': 'Não',
                'work_mode': 'Remoto',
                'cost': '650'
            }
        },

        'short_description': {
            'name': 'Tester Geek',
            'lastname': 'Short Description',
            'email': 'testergeekshortdescription@getgeeks.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '11999999999',
                'description': 'Desenvolvedor Fullstack',
                'printer_repair': 'Não',
                'work_mode': 'Ambos',
                'cost': '500'
            }
        },

        'long_description': {
            'name': 'Tester Geek',
            'lastname': 'Long Description',
            'email': 'testergeeklongdescription@getgeeks.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999999999',
                'description': 'Desenvolvedor Fullstack, especialista em desenvolvimento web com React e APIs rest em Node.js, também desenvolvo Apps Mobile com React Native e desenvolvo testes automatizados com Cypress e Robot Framework. Nas horas vagas futeboleiro de boteco e skatista.',
                'printer_repair': 'Não',
                'work_mode': 'Presencial',
                'cost': '800'
            }
        }

    }

    return data[target]
