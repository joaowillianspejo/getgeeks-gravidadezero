def factory_new_user():
    user = {
        'name': 'New User',
        'email': 'newuser@getgeeks.com',
        'password': 'pwd123'
    }

    return user


def factory_get_user():
    user = {
        'name': 'Get User',
        'email': 'getuser@getgeeks.com',
        'password': 'pwd123'
    }

    return user


def factory_remove_user():
    user = {
        'name': 'Remove User',
        'email': 'removeuser@getgeeks.com',
        'password': 'pwd123'
    }

    return user


def factory_update_user():
    email = 'updateuser@outlook.com'

    user = {
        'before': {
            'name': 'Update User',
            'email': email,
            'password': 'pwd123'
        },
        'after': {
            'name': 'João Ninguém',
            'email': email,
            'whatsapp': '11999999999',
            'avatar': 'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png'
        }
    }

    return user


def factory_user_session(target):
    name = 'Tester API'
    email = 'testerapi@getgeeks.com'
    password = 'pwd123'

    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }

    return data[target]


def factory_be_geek():
    user = {
        'name': 'Maria Fifi',
        'email': 'mariafifi@getgeeks.com',
        'password': 'pwd123',
        'geek_profile': {
            'whatsapp': '11999999999',
            'desc': 'Desenvolvedor Fullstack, especialista em desenvolvimento web com React e APIs rest em Node.js, também desenvolvo Apps Mobile com React Native e desenvolvo testes automatizados com Cypress e Robot Framework.',
            'printer_repair': 'Não',
            'work': 'Remoto',
            'cost': '500'
        }
    }

    return user


def factory_search_for_geeks():
    user = {
        'user': {
            'name': 'Carlos Tenório',
            'email': 'carlostenorio@getgeeks.com',
            'password': 'pwd123'
        },
        'geeks': [
            {
                "name": "Riri Willians",
                "email": "riri@marvel.com",
                "password": "pwd123",
                "geek_profile": {
                    "whatsapp": "11999999999",
                    "desc": "Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.",
                    "printer_repair": "Não",
                    "work": "Presencial",
                    "cost": "100"
                }
            },
            {
                "name": "Arnim Zola",
                "email": "zola@hidra.com",
                "password": "pwd123",
                "geek_profile": {
                    "whatsapp": "21999999999",
                    "desc": "Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit",
                    "printer_repair": "Não",
                    "work": "Ambos",
                    "cost": "110"
                }
            },
            {
                "name": "Reed Richards",
                "email": "reed@fantastic4.com",
                "password": "pwd123",
                "geek_profile": {
                    "whatsapp": "31999999999",
                    "desc": "Instalado e faço manutenção em qualquer tipo de impressora, matricial padrão, matricial fiscal, a jato, a cera, a laser e até 3D. Também faço remold de fitas coloridas para Epson LX300. ",
                    "printer_repair": "Sim",
                    "work": "Remoto",
                    "cost": "120"
                }
            }
        ]
    }

    return user
