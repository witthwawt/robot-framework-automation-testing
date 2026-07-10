*** Settings ***
Library           SeleniumLibrary

Test Setup        Run Keywords    Open Browser    ${LOGIN_URL}    ${BROWSER}    AND    Maximize Browser Window

Test Teardown     Close Browser

Library           String

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
    Input Text       id=user_login    Demo_user
    Input Text       id=user_pass     Demo_pass
    Click Button     id=wp-submit
    Wait Until Location Is    ${ADMIN_URL}    timeout=15s
    Wait Until Element Is Visible    id=adminmenu    timeout=10s

    Click Link                       xpath=//a[.='แผงควบคุม']
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/index.php    timeout=10s

    Wait Until Element Is Visible    xpath=//a[contains(., 'Flatsome')]    timeout=10s
    Click Element                    xpath=//a[contains(., 'Flatsome')]
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/admin.php?page=flatsome-panel    timeout=10s

    Wait Until Element Is Visible    xpath=//div[contains(@class, 'wp-menu-name') and .='เรื่อง']    timeout=10s
    Click Element                    xpath=//div[contains(@class, 'wp-menu-name') and .='เรื่อง']
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/edit.php    timeout=10s

    Wait Until Element Is Visible    xpath=//a[contains(., 'Portfolio')]    timeout=10s
    Click Element                    xpath=//a[contains(., 'Portfolio')]
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/edit.php?post_type=featured_item    timeout=10s

    Wait Until Element Is Visible    xpath=//div[contains(@class, 'wp-menu-name') and .='สื่อ']    timeout=10s
    Click Element                    xpath=//div[contains(@class, 'wp-menu-name') and .='สื่อ']
    Wait Until Location Is           https://pgstar777-guru.com/wp-admin/upload.php    timeout=10s

    Wait Until Element Is Visible    xpath=//div[contains(@class, 'wp-menu-name') and normalize-space(.)='เรื่อง']    timeout=10s
    Click Element                    xpath=//div[contains(@class, 'wp-menu-name') and normalize-space(.)='เรื่อง']

    Wait Until Location Contains     /wp-admin/edit.php    timeout=10s
    Wait Until Element Is Visible    id=post-search-input    timeout=10s
    Clear Element Text               id=post-search-input
    Input Text                       id=post-search-input    pgstar777
    Click Element                    id=search-submit

    Wait Until Location Contains     /wp-admin/edit.php?s=pgstar777    timeout=10s
    Page Should Contain              pgstar777
    Capture Page Screenshot          screenshots/search-post.png

    Wait Until Element Is Visible    xpath=//div[contains(@class, 'wp-menu-name') and normalize-space(.)='ผู้ใช้']    timeout=10s
    Click Element                    xpath=//div[contains(@class, 'wp-menu-name') and normalize-space(.)='ผู้ใช้']

    Wait Until Location Contains     /wp-admin/users.php    timeout=10s
    Wait Until Element Is Visible    id=user-search-input    timeout=10s
    Clear Element Text               id=user-search-input
    Input Text                       id=user-search-input    admin
    Click Element                    id=search-submit

    Wait Until Location Contains     /wp-admin/users.php?s=admin    timeout=10s
    Page Should Contain              admin
    Capture Page Screenshot          screenshots/search-user.png

    Wait Until Element Is Visible
    ...    xpath=//div[contains(@class, 'wp-menu-name') and contains(normalize-space(.), 'ปลั๊กอิน')]
    ...    timeout=10s

    Click Element
    ...    xpath=//div[contains(@class, 'wp-menu-name') and contains(normalize-space(.), 'ปลั๊กอิน')]

    Wait Until Location Contains     /wp-admin/plugins.php    timeout=10s
    Wait Until Element Is Visible    id=plugin-search-input    timeout=10s
    Clear Element Text               id=plugin-search-input
    Input Text                       id=plugin-search-input    301 Redirects

    Wait Until Location Contains     /wp-admin/plugins.php?s=301%20Redirects    timeout=10s
    Wait Until Page Contains         301 Redirects    timeout=10s
    Capture Page Screenshot          screenshots/search-plugin.png

    # =========================================================
    Wait Until Element Is Visible
    ...    xpath=//div[contains(@class, 'wp-menu-name') and normalize-space(.)='Portfolio']
    ...    timeout=10s

    Click Element
    ...    xpath=//div[contains(@class, 'wp-menu-name') and normalize-space(.)='Portfolio']

    Wait Until Element Is Visible
    ...    xpath=//a[contains(@href, 'post-new.php?post_type=featured_item') and normalize-space(.)='Add New']
    ...    timeout=10s

    Click Element
    ...    xpath=//a[contains(@href, 'post-new.php?post_type=featured_item') and normalize-space(.)='Add New']

    Wait Until Location Contains
    ...    /wp-admin/post-new.php?post_type=featured_item
    ...    timeout=10s

    Wait Until Element Is Visible    id=title    timeout=10s
    Input Text                       id=title    Robot Framework Test Portfolio

    Wait Until Element Is Visible
    ...    xpath=//iframe[contains(@id, 'content_ifr')]
    ...    timeout=10s

    Select Frame
    ...    xpath=//iframe[contains(@id, 'content_ifr')]

    Wait Until Element Is Visible    id=tinymce    timeout=10s
    Click Element                    id=tinymce
    Input Text
    ...    id=tinymce
    ...    This portfolio was created automatically using Robot Framework and SeleniumLibrary.

    Unselect Frame

    Capture Page Screenshot
    ...    screenshots/portfolio-form-before-publish.png

    Wait Until Element Is Visible    id=publish    timeout=10s
    Click Element                    id=publish

    Wait Until Location Contains
    ...    /wp-admin/post.php?post=
    ...    timeout=15s

    Wait Until Location Contains
    ...    &action=edit
    ...    timeout=10s

    Wait Until Page Contains
    ...    Robot Framework Test Portfolio
    ...    timeout=10s

    Capture Page Screenshot
    ...    screenshots/portfolio-created.png

    # =========================================================
    Wait Until Element Is Visible
    ...    xpath=//div[contains(@class, 'wp-menu-name') and normalize-space(.)='ผู้ใช้']
    ...    timeout=10s

    Click Element
    ...    xpath=//div[contains(@class, 'wp-menu-name') and normalize-space(.)='ผู้ใช้']

    Wait Until Element Is Visible
    ...    xpath=//a[contains(@href, 'user-new.php') and normalize-space(.)='Add User']
    ...    timeout=10s

    Click Element
    ...    xpath=//a[contains(@href, 'user-new.php') and normalize-space(.)='Add User']

    Wait Until Location Contains    /wp-admin/user-new.php    timeout=10s

    ${RANDOM}=      Generate Random String    5    [NUMBERS]
    ${USERNAME}=    Set Variable                    robot${RANDOM}
    ${EMAIL}=       Set Variable                    robot${RANDOM}@gmail.com

    Wait Until Element Is Visible    id=user_login    timeout=10s
    Input Text                       id=user_login    ${USERNAME}
    Input Text                       id=email         ${EMAIL}
    Input Text                       id=first_name    Robot
    Input Text                       id=last_name     Tester

    Wait Until Element Is Visible
    ...    xpath=//button[contains(@class, 'wp-generate-pw')]
    ...    timeout=10s

    Click Element
    ...    xpath=//button[contains(@class, 'wp-generate-pw')]

    Capture Page Screenshot
    ...    screenshots/add-user-form.png

    Wait Until Element Is Visible    id=createusersub    timeout=10s
    Click Element                    id=createusersub

    Wait Until Location Contains
    ...    /wp-admin/users.php
    ...    timeout=15s

    Wait Until Page Contains
    ...    ${USERNAME}
    ...    timeout=10s

    Capture Page Screenshot
    ...    screenshots/user-created.png

    # =========================================================
    Wait Until Element Is Visible
    ...    xpath=//a[contains(@href, '/wp-admin/profile.php') and contains(@class, 'ab-item')]
    ...    timeout=10s

    Mouse Over
    ...    xpath=//a[contains(@href, '/wp-admin/profile.php') and contains(@class, 'ab-item')]

    Wait Until Element Is Visible
    ...    xpath=//span[contains(@class, 'edit-profile') and normalize-space(.)='แก้ไขโปรไฟล์']
    ...    timeout=10s

    Click Element
    ...    xpath=//span[contains(@class, 'edit-profile') and normalize-space(.)='แก้ไขโปรไฟล์']

    Wait Until Location Contains    /wp-admin/profile.php    timeout=10s

    Wait Until Element Is Visible    id=first_name    timeout=10s
    Clear Element Text               id=first_name
    Input Text                       id=first_name    admin 3

    Capture Page Screenshot          screenshots/profile-before-update.png

    Wait Until Element Is Visible    id=submit    timeout=10s
    Click Element                    id=submit

    Wait Until Element Is Visible    id=first_name    timeout=10s
    Textfield Value Should Be        id=first_name    admin 3

    Capture Page Screenshot          screenshots/profile-updated.png
