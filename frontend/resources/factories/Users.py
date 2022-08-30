import bcrypt

from faker import Faker
fake = Faker()


def get_hashed_password(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def users_to_insert_db():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher')
    ]

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

        'attempt_be_geek': {
            'name': 'Tester',
            'lastname': 'Attempt Be Geek',
            'email': 'testerattemptbegeek@getgeeks.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999999999',
                'description': 'Desenvolvedor Fullstack, especialista em desenvolvimento web com React e APIs rest em Node.js, também desenvolvo Apps Mobile com React Native e desenvolvo testes automatizados com Cypress e Robot Framework.',
                'printer_repair': 'Não',
                'work_mode': 'Presencial',
                'cost': '800'
            }
        },

        'searcher': {
            'name': 'Searcher',
            'lastname': 'User',
            'email': 'searcheruser@outlook.com',
            'password': 'searcher@123'
        },

        'search_alien': {
            'name': 'Alien',
            'lastname': 'User',
            'email': 'alienuser@outlook.com',
            'password': 'alien@123',
            'geek_profile': {
                'whatsapp': '13999999999',
                'description': 'Desenvolvedor Fullstack, especialista em desenvolvimento web com React e APIs rest em Node.js, também desenvolvo Apps Mobile com React Native e desenvolvo testes automatizados com Cypress e Robot Framework.',
                'printer_repair': 'Sim',
                'work_mode': 'Presencial',
                'cost': '650'
            }
        },

        'search_common': {
            'name': 'Common',
            'lastname': 'User',
            'email': 'commonuser@outlook.com',
            'password': 'common@123',
            'geek_profile': {
                'whatsapp': '11999999999',
                'description': 'Desenvolvedor Fullstack, especialista em desenvolvimento web com React e APIs rest em Node.js, também desenvolvo Apps Mobile com React Native e desenvolvo testes automatizados com Cypress e Robot Framework.',
                'printer_repair': 'Não',
                'work_mode': 'Remoto',
                'cost': '650'
            }
        }

    }

    return data[target]
