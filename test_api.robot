*** Settings ***
Library  RequestsLibrary

*** Test Cases ***
Test Addition API
    [Documentation]  Test the /is_prime/x endpoint of the API
    [Tags]  API
    Create Session  api_session  http://localhost:8080  # Adjust the URL based on your API's address and port

    #Test case for true_when_x_is_17 
    ${response} Get on Session api_session /is_prime/17
    Should Be Equal As Numbers ${response.status_code}  ${200}
    ${result}  Set Variable  ${response.json()["result"]}
    Should Be True  ${result}

*** Keywords ***
Should Be Equal As Numbers
    [Arguments]  ${actual}  ${expected}
    Should Be Equal  ${actual}  ${expected}
