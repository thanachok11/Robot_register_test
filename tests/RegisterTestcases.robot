*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/RegistrationPage.robot
Variables   ../resources/config.yaml
Variables   ../resources/testdata.yaml
Suite Setup    Open Browser    ${baseUrl}    chrome
Suite Teardown    Close Browser

*** Test Cases ***
Register a New User
    [Documentation]    Register a new user on Future Skill using email thanachok.suwan@gmail.com
    Fill Registration Form    ${firstName}    ${lastName}    ${registration_email}    ${registration_password}    ${registration_password}    ${registration_phone}
     # Verify OTP and enter code (for now, we can use a dummy OTP like '123456' for the test)
    Verify OTP Page and Enter Code    123456
    Wait Until Page Contains    ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์    20s
    # More generic xpath to check if any text containing 'ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์' appears
    Wait Until Element Is Visible    xpath=//*[contains(text(),'ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์')]    20s
    Element Should Contain    xpath=//*[contains(text(),'ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์')]    "ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์"

