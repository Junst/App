# Cherry Record

"Cherry Record" is the app that everyone can record their own archievements. 

## Getting Started

I used Flutter and Android Studio. So you have to download those two applications and my github code.


### Home
![image](https://github.com/Junst/App/blob/main/Flutter/Ranking%20App/README/home.png)

This is the Main Home that you can see the "Trending" of "Record(Archeivements)", "Category", and "Friends".

### Login
![image](https://github.com/Junst/App/blob/main/Flutter/Ranking%20App/README/login.png)

Also you have to get your accounts by sighnup in this app. Maybe You have to change my code in "Ranking App-lib-login_app" and "Ranking App-android" dicretory(folder) for changing server like AWS or Firebase etc...


### notice
![image](https://github.com/Junst/App/blob/main/Flutter/Ranking%20App/README/notice.png)

There has a four button in bottom bar. "Home", "Category", "Notice", and "Status" with "Upload" in center.
In notice page, you can check your account's notice for your follwer or "like" in your post. 

### Search

![image](https://github.com/Junst/App/blob/main/Flutter/Ranking%20App/README/search.png)

You can see the Search bar on Main page or other looks like search bar. In search bar you can search your register's achievements that can be made by administrator(the developer of this app) or registers. I made achievement's data in "Ranking App-lib-data-record.dart" file. You can see the form of "Record(acheivements) data". There has a "img" (image file), "id" (use in search bar, for small amount of text can be recognized in searching), "name" (is shown in app), "describe" (describe), "challenger" (how many people achieve this or maybe how many people interest in this record), and "popular" (hard to achieve when it is small number). You can add or delete as you want to make or modify this code.

### trending now

![image](https://github.com/Junst/App/blob/main/Flutter/Ranking%20App/README/trending_now.png)

"Trending now" page is found in main page. You can modify this trending now page in "Ranking App-lib-screens-trending.dart" file. Of course if you want to make new screens of Record(Achievements) go to "Ranking App-lib-screens-personal_screens" directory(Folder) and add the dart file.


### upload 

![image](https://github.com/Junst/App/blob/main/Flutter/Ranking%20App/README/upload.png)

You can upload image file to confirm your record. If you upload the file, this file goes server(my server was firebase), administrator(developer) can save the state of register to conform or get. (I not made this conform process it just idea or my thinking)


### record

![image](https://github.com/Junst/App/blob/main/Flutter/Ranking%20App/README/record1.png)

I told you that if you want to make new screens of Record(Achievements) go to "Ranking App-lib-screens-personal_screens" directory(Folder) and add the dart file. The record page has a title which is same with "name" of "Ranking App-lib-data-record.dart" file, Total Achivement person which is same with "challenger", and Relevant Title which is setting by developer(me) thinking relevant of this title.

