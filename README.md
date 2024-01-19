My main goal for the app was to keep it simplistic, for this i used the MVVM architecture

- i started by testing out the API using postman and defined all the routes i was going to use.
- Next i built models for the data responses based on the results i saw in Postman
- I then built the SearchViewModel file, this files purpose is to handle the initial search of "yorkshire" but also return data for custom searches, there are also functions within to get the extra details about each photo that is returned, this is so that data can be passed into child views via a NavigationLink
- I Then wrote tests for the SearchViewModel core functions and proceeded to build the SearchView UI
- After that i built the UserInfoViewModel with the purpose of returning User specific data such as their photos
- With that in mind i started working on passing the data down the line from the SearchView via navigation links to allow the user to navigate to -> PhotoDetails or -> UserDetails
- Next i proceeded to write tests for the UserInfoViewModel core functionality


* Due to time constraints with work i wasnt able to add in any Additional features unfortunately
* I used no external Packages
  
