*** Settings ***
Documentation		BeGeek actions

*** Keywords ***
Go To Geek Form
  Click   css=a[href="/be-geek"] >> text=Seja um Geek
  Wait For Elements State   css=.be-geek-form   visible

Go To Geeks
  Click   css=a[href="/geek"] >> text=Geeks
  Wait For Elements State   css=.title strong >> text=Estes são os Geeks disponíveis.   visible

Fill Geek Form
  [Arguments]   ${geek_profile}

  Reset Geek Form

  Fill Text   css=input#whatsapp    ${geek_profile}[whatsapp]
  Fill Text   css=textarea#desc     ${geek_profile}[description]

  IF    '${geek_profile}[printer_repair]'
    Select Options By   css=select#printer_repair   value   ${geek_profile}[printer_repair]
  END

  IF    '${geek_profile}[work_mode]'
    Select Options By   css=select#work             value   ${geek_profile}[work_mode]
  END

  Fill Text   css=input#cost        ${geek_profile}[cost]

Fill Search Form
  [Arguments]   ${target_option}   ${target_text}

  IF    '${target_option}'
    Select Options By   css=select#printer_repair   value   ${target_option}
  END

  Fill Text   css=input#desc    ${target_text}

Submit Geek Form
  Click   css=button[type="submit"] >> text=Quero ser um Geek

Submit Search Form
  Click   css=button[type="submit"] >> text=Buscar

Geek Form Should Be Success
  ${expect_message}   Set Variable    Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

  Wait For Elements State   css=p >> text=${expect_message}   visible

Geek Should Be Found
  [Arguments]   ${geek}

  ${full_name}      Set Variable    ${geek}[name] ${geek}[lastname]

  ${target_geek}    Get Element    xpath=//strong[contains(text(), "${full_name}")]/../../..

  ${work}           Convert To Lower Case   ${geek}[geek_profile][work_mode]

  Get Text    ${target_geek}   contains    Atendimento ${work}
  Get Text    ${target_geek}   contains    ${geek}[geek_profile][description]
  Get Text    ${target_geek}   contains    ${geek}[geek_profile][cost]

  Set Suite Variable    ${target_geek}

Alien Icon Should Be Visible
  Get Text    ${target_geek}   contains    👽

Search Alert Should Be
  [Arguments]   ${expected_alert}

  Wait For Elements State   css=.search-not-found p >> text=${expected_alert}   visible

Reset Geek Form
  Execute Javascript    document.getElementsByClassName("be-geek-form")[0].reset();