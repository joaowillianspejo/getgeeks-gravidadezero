*** Settings ***
Documentation   Attempt BeGeek test suite

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup     Start Session For Attempt Be Geek
Test Template   Attempt Be a Geek

***Variables***
${long_description}   Desenvolvedor Fullstack, especialista em desenvolvimento web com React e APIs rest em Node.js, também desenvolvo Apps Mobile com React Native e desenvolvo testes automatizados com Cypress e Robot Framework. Nas horas vagas futeboleiro de boteco e skatista.

*** Test Cases ***
Short Description       description       Desenvolvedor Fullstack   A descrição deve ter no minimo 80 caracteres
Long Description        description       ${long_description}       A descrição deve ter no máximo 255 caracteres
Empty Description       description       ${EMPTY}                  Informe a descrição do seu trabalho

WhatsApp Only DDD       whatsapp          11                        O Whatsapp deve ter 11 digitos contando com o DDD
WhatsApp Without DDD    whatsapp          999999999                 O Whatsapp deve ter 11 digitos contando com o DDD
Empty WhatsApp          whatsapp          ${EMPTY}                  O Whatsapp deve ter 11 digitos contando com o DDD

Empty Printer Repair    printer_repair    ${EMPTY}                  Por favor, informe se você é um Geek Supremo
Empty Work Mode         work_mode         ${EMPTY}                  Por favor, selecione o modelo de trabalho

Cost Only Letters       cost              abc                       Valor hora deve ser numérico
Cost With Cipher        cost              R$ 100                    Valor hora deve ser numérico
Empty Cost              cost              ${EMPTY}                  Valor hora deve ser numérico

*** Keywords ***
Attempt Be a Geek
  [Arguments]   ${key}    ${input_field}    ${output_message}

  ${user}   Factory User    attempt_be_geek

  Set To Dictionary   ${user}[geek_profile]   ${key}    ${input_field}

  Fill Geek Form    ${user}[geek_profile]
  Submit Geek Form
  Alert Span Should Be    ${output_message}

  After Test

Start Session For Attempt Be Geek
  ${user}   Factory User    attempt_be_geek

  Start Session
  Do Login    ${user}
  Go To Geek Form