*** Settings ***
Library    Browser

*** Test Cases ***
Avataan web-sivu ja yhteystiedot
    New Browser    chromium        headless=False  
    New Page    https://www.snowland.fi/
    Click    role=link[name="Yhteystiedot"]

    # Odotetaan, jos eväste-kysely tulee näkyviin
    ${popup_visible}=    Run Keyword And Return Status    Wait For Elements State    css=button[data-hook="consent-banner-apply-button"]    visible    timeout=5s

    # Klikataan Hyväksy, jos eväste-kysely näkyy
    Run Keyword If    ${popup_visible}    Click    css=button[data-hook="consent-banner-apply-button"]

    # Täytetään asiakkaan tiedot kolmeen tekstikenttään
    Fill Text    css=input[aria-label="Nimi"]    Testi Käyttäjä
    Fill Text    css=input[aria-label="Sähköpostiosoite"]    testi@testi.fi
    Fill Text    css=input[aria-label="Puhelinnumero. Puhelinnumero"]    0504442

    # Suljetaan selain
    Close Browser
