#  Drinks App / Aplikacja Drinks

---

## 🇬🇧 English

### About the App
The **Drinks App** is a **mobile application** located in  
`/src/mobile/drinks`, built using the **Flutter framework**.

The application allows users to explore various drinks via a public Drinks API.  
It includes the following features:

- **Drink list** – dynamically loaded from the Drinks API  
  ![Drink list](doc/img/en_drink_list.jpg)
- **Drink details** – displaying name, image, and preparation method  
  ![Drink details](doc/img/en_drink_details.jpg)
- **Ingredients list** – shows all ingredients used for each drink  
  ![Ingredients list](doc/img/ingredients.jpg)
- **Language settings panel** – allows switching between supported languages  
  ![Language settings](doc/img/en_settings.jpg)

### Technologies and Packages
- `flutter_localizations` – internationalization and localization support  
- `http` – HTTP client for API communication  
- `infinite_scroll_pagination` – efficient pagination for drink lists  
- `get_it` – dependency injection and singleton management  

### How to Run
```bash
cd src/mobile/drinks
flutter pub get
flutter run 
```

# Aplikacja Drinks

## O aplikacji
**Aplikacja Drinks** to **aplikacja mobilna**, znajdująca się w  
`/src/mobile/drinks`, napisana we frameworku **Flutter**.

Aplikacja umożliwia przeglądanie różnych napojów z publicznego API Drinks.  
Zawiera następujące funkcjonalności:

- **Lista napojów** – dynamicznie pobierana z API Drinks  
  ![Lista napojów](doc/img/pl_drink_search.jpg)(doc/img/pl_drink_list.jpg)
- **Szczegóły napoju** – wyświetla nazwę, obraz oraz sposób przygotowania  
  ![Szczegóły napoju](doc/img/pl_drink_details.jpg)
-  **Lista składników** – prezentuje wszystkie składniki danego napoju  
  ![Lista składników](doc/img/ingredients.jpg)
- **Panel językowy** – umożliwia zmianę języka aplikacji  
  ![Panel językowy](doc/img/pl_settings.jpg)

## Użyte technologie i pakiety
- `flutter_localizations` – obsługa tłumaczeń i lokalizacji  
- `http` – klient HTTP do komunikacji z API  
- `infinite_scroll_pagination` – paginacja listy napojów  
- `get_it` – rejestracja i pobieranie singletonów (dependency injection)

## Jak uruchomić
```bash
cd src/mobile/drinks
flutter pub get
flutter run
```