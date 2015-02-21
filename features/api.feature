Feature: API response

Scenario Outline: Correct error code is returned
  Given I query TOD with the following parameters: "<Station>", "<Length>", "<Zip>", "<adType>"
  Then I should observe that TOD responded with the error code: "<Code>"

  Examples:
    | Station     | Length | Zip   | adType   | Code |
    | NOTASTATION | 30     | 10010 | audio    | 1    |
    | QATESTING   | 30     | 10010 | Ethereal | 2    |
    | QATESTING   | 7      | 10010 | audio    | 3    |
    | QATESTING   | 30     | 11111 | audio    | 4    |


Scenario Outline: Correct companion visual image size is returned
  Given I query TOD with default parameters and a companionWidth of "<companionWidth>" and companionHeight of "<companionHeight>"
  Then I should observe that TOD returned a MediaFile with a width of "<companionWidth>" and a height of "<companionHeight>"

  Examples:
    | companionWidth  | companionHeight |
    | 180             | 135             |
    | 180             | 150             |
    | 300             | 250             |
    | 320             | 240             |
    | 336             | 280             |

Scenario Outline: Correct media type is returned
  Given I query TOD with default parameters and an audioFormat value of: "<audioFormat>"
  Then I should observe that TOD returned the corresponding media type: "<mediatype>"

  Examples:
    | audioFormat | mediatype  |
    | mp3         | audio/mpeg |
    | aac         | audio/aac  |
    | ogg         | audio/ogg  |
