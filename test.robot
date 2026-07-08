*** Settings ***
Library           SeleniumLibrary
# สั่งให้ทุกเคสเริ่มด้วยการเปิดเบราว์เซอร์อัตโนมัติ
Test Setup        Run Keywords    Open Browser    ${LOGIN_URL}    ${BROWSER}    AND    Maximize Browser Window
# สั่งให้ทุกเคสปิดเบราว์เซอร์อัตโนมัติเมื่อจบเคส ไม่ต้องเขียน [Teardown] ซ้ำ ๆ
Test Teardown     Close Browser

*** Variables ***
${LOGIN_URL}      https://pgstar777-guru.com/wp-login.php?redirect_to=https%3A%2F%2Fpgstar777-guru.com%2Fwp-admin%2F&reauth=1
${ADMIN_URL}      https://pgstar777-guru.com/wp-admin/
${BROWSER}        edge

*** Test Cases ***

Scenario 1: WordPress Login Fail With Wrong Password
    Wait Until Element Is Visible    id=user_login    timeout=10s
    Input Text       id=user_login    admin
    Input Text       id=user_pass     wrongpassword123
    Click Button     id=wp-submit
    Wait Until Page Contains    Error    timeout=10s

Scenario 2: WordPress Login Fail With Wrong user and Password
    Wait Until Element Is Visible    id=user_login    timeout=10s
    Input Text       id=user_login    wronguser999
    Input Text       id=user_pass     wrongpass999
    Click Button     id=wp-submit
    Wait Until Page Contains    Error    timeout=10s

Scenario 3: WordPress Login Success
    Wait Until Element Is Visible    id=user_login    timeout=10s
    Input Text       id=user_login    admin
    Input Text       id=user_pass     0h8uZJdHzV2B0bBD1)Zju(eS
    Click Button     id=wp-submit
    Wait Until Location Is    ${ADMIN_URL}    timeout=15s
    Wait Until Element Is Visible    id=adminmenu    timeout=10s

    # 1. คลิกที่ แผงควบคุมrobot test.robot
    Click Link                       xpath=//a[.='แผงควบคุม']
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/index.php    timeout=10s

    # 2. คลิกที่ Flatsome
    Wait Until Element Is Visible    xpath=//a[contains(., 'Flatsome')]    timeout=10s
    Click Element                    xpath=//a[contains(., 'Flatsome')]
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/admin.php?page=flatsome-panel    timeout=10s

    # 3. คลิกที่ เรื่อง
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'wp-menu-name') and .='เรื่อง']    timeout=10s
    Click Element                    xpath=//div[contains(@class, 'wp-menu-name') and .='เรื่อง']
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/edit.php    timeout=10s

    # 4. คลิกที่ Portfolio
    Wait Until Element Is Visible    xpath=//a[contains(., 'Portfolio')]    timeout=10s
    Click Element                    xpath=//a[contains(., 'Portfolio')]
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/edit.php?post_type=featured_item    timeout=10s

    # 5. คลิกที่ สื่อ
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'wp-menu-name') and .='สื่อ']    timeout=10s
    Click Element                    xpath=//div[contains(@class, 'wp-menu-name') and .='สื่อ']
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/upload.php    timeout=10s