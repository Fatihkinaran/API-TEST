Feature: Trello API Entegrasyonu

  Background:
    * def apiKey = 'e888d7ecc9bdabc92156ad646c6f2527'
    * def apiToken = 'ATTA116e0dd48d6c31b19a6a2ab2951d93c594b35b9905b57de9e59d0fef55ff71712B91B6D1'
    * def baseUrl = 'https://api.trello.com/1'
    * def boardId = ''
    * def listId = ''
    * def cardId = ''

  Scenario: Trello Pano Oluştur
    Given url baseUrl + '/boards/'
    And param name = 'Yeni Pano'
    And param key = apiKey
    And param token = apiToken
    When method post
    Then status 200
    * eval boardId = response.id

  Scenario: Trello Listesi Oluştur
    Given url baseUrl + '/lists'
    And param name = 'Yeni Liste'
    And param idBoard = boardId
    And param key = apiKey
    And param token = apiToken
    When method post
    Then status 200
    * eval listId = response.id

  Scenario: Trello Kartı Oluştur
    Given url baseUrl + '/cards'
    And param name = 'Yeni Kart'
    And param idList = listId
    And param key = apiKey
    And param token = apiToken
    When method post
    Then status 200
    * eval cardId = response.id

  Scenario: Trello Kart Detaylarını Güncelle
    Given url baseUrl + '/cards/' + cardId
    And param name = 'Güncellenmiş Kart İsmi'
    And param desc = 'Güncellenmiş Açıklama'
    And param key = apiKey
    And param token = apiToken
    When method put
    Then status 200