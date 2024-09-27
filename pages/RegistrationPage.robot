*** Keywords ***
Open Registration Page
    [Documentation]    Navigate to the registration page
    Open Browser    ${baseUrl}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//a[contains(text(),'สมัครสมาชิก')]    10s
    Click Element    xpath=//a[contains(text(),'สมัครสมาชิก')]    # Click on 'Register' link

Fill Registration Form
    [Arguments]    ${firstName}    ${lastName}    ${email}    ${password}    ${confirmPassword}    ${phone}
    [Documentation]    Fill out the registration form with first name, last name, email, password, confirm password, and phone number
    
    # First Name field
    Wait Until Element Is Visible    xpath=//input[@name='firstName']    20s
    Input Text    xpath=//input[@name='firstName']    ${firstName}

    # Last Name field
    Wait Until Element Is Visible    xpath=//input[@name='lastName']    10s
    Input Text    xpath=//input[@name='lastName']    ${lastName}

    # Email field
    Wait Until Element Is Visible    xpath=//input[@name='email']    10s
    Input Text    xpath=//input[@name='email']    ${email}

    # Phone field
    Wait Until Element Is Visible    xpath=//input[@name='phoneNumber']    10s
    Input Text    xpath=//input[@name='phoneNumber']    ${phone}

    # New Password field
    Wait Until Element Is Visible    xpath=//input[@name='newPassword']    10s
    Input Text    xpath=//input[@name='newPassword']    ${password}

    # Confirm Password field
    Wait Until Element Is Visible    xpath=//input[@name='confirmPassword']    10s
    Input Text    xpath=//input[@name='confirmPassword']    ${confirmPassword}

    # Consent checkbox
    Wait Until Element Is Visible    xpath=//input[@name='consent']    10s
    Click Element    xpath=//input[@name='consent']    # Click the consent checkbox

    # Submit button using xpath or class
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'สมัครสมาชิก')]    10s
    Click Button    xpath=//button[contains(text(), 'สมัครสมาชิก')]

Verify OTP Page and Enter Code
    [Arguments]    ${otpCode}
    [Documentation]    Verify that the OTP page is displayed and enter the OTP code
    
    # Wait until the OTP input field is visible
    Wait Until Element Is Visible    xpath=//input[@name='otpCode']    20s
    Input Text    xpath=//input[@name='otpCode']    ${otpCode}
    sleep     2s
    # Optionally click the confirm or submit button after entering the OTP
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'ยืนยัน')]    10s
    Click Button    xpath=//button[contains(text(), 'ยืนยัน')]
