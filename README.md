# Seoudi Weather App

## Overview

Seoudi Weather is a user-friendly weather application that provides real-time weather updates and forecasts for selected locations. 
The app is designed to offer a seamless experience for users to view current weather conditions and hourly forecasts. 
It features a dynamic interface with options to switch between Celsius and Fahrenheit, 
and allows users to select different locations to get detailed weather information.


## Screenshots

### Main Screen
![Locations Screen](assets/1.png)
![Main Screen with Fahrenheit state](assets/2.png)
![Main Screen with Celsius state](assets/3.png)
 
## Features

- **Current Weather Details:** Displays the current temperature, weather condition icon, and city name.
- **Hourly Forecast:** Shows an hourly forecast with temperature and weather icons in a horizontally scrolling collection view.
- **Temperature Conversion:** Easily toggle between Celsius and Fahrenheit units.
- **Location Selection:** View a list of predefined locations and select one to see its weather details.
- **Dynamic Backgrounds:** Background images update based on the time of day (day/night).
   
## Usage

1. **WeatherDetailsViewController:**
WeatherDetailsViewController manages the display of weather details for a selected city. Key components include:

UI Components:
headerView: The view at the top of the screen, containing the city name and temperature.
cityLabel: Displays the name of the city.
temperatureLabel: Shows the current temperature.
weatherIcon: Displays an icon representing the current weather condition.
hourlyForecastLabel: A label showing the title for the hourly forecast section.
hourlyCollectionView: A horizontally scrolling collection view showing hourly weather data.
backgroundView: Updates the background image based on the time of day.
locationImage: An image representing the location button.
temperatureImage: An image for the temperature toggle button.

Properties:
viewModel: Manages weather data and handles API requests.
loader: Displays a loading spinner during data fetches.
temperatureCelsius: A Boolean value that toggles temperature units between Celsius and Fahrenheit.

Methods:
setupUI(): Configures all UI elements.
convert(temperature:to:): Converts temperature between Celsius and Fahrenheit.
setCardDate(data:): Updates the UI with the provided weather data.

2. **LocationsViewController:**
LocationsViewController displays a list of locations from which users can choose to view weather details. Key components include:

UI Components:
tableView: Displays the list of locations with a cell for each location.
Properties:
viewModel: Provides the list of locations and manages data.

Methods:
tableViewConfiguration(): Configures the table view with data, cell appearance, and actions.
Design and Architecture

## Architecture

MVVM Architecture: The app uses the Model-View-ViewModel (MVVM) architecture to separate concerns and enhance maintainability.
Model: Represents the data structures (e.g., BaseModel, LocationModel).
View: Manages the user interface (e.g., WeatherDetailsViewController, LocationsViewController).
ViewModel: Handles the business logic and data manipulation (e.g., WeatherDetailsViewModel, LocationsViewModel).
Networking: Data is fetched from a weather API using Combine framework to handle asynchronous tasks.
Styling: Uses a custom styling approach for UI elements and supports dynamic backgrounds based on the time of day.


## Installation

To get started with Seoudi Weather, follow these steps:

**Clone the Repository:**
