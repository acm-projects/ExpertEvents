# ExpertEvents

## Summary

Are you a student struggling to attract attendees for your organization's events through posters and Instagram posts? Alternatively, do you often miss out on exciting campus events because you only learn about them after they've concluded? ExpertEvents is the solution. With a user-friendly interface, event recommendations, and seamless integration with your calendar app, ExpertEvents keeps you in the loop with real-time notifications. This app enables organizers to promote events to the entire student population and allows students to stay informed about campus happenings, effortlessly notifying and inviting friends and engaging in discussions through our in-app community space. ExpertEvents is where events come to life, and the campus community thrives.

## MVP

- User account with user authentication
- UTD student organization accounts (authorized to upload images of posters/events to feed)
- Events feed to showcase event posters (posted by organization accounts) to users
- “interested” and “not interested” buttons below posts for users
- Upcoming events tab for displaying registered events
- Friend’s tab for list of friends/search to add friends
- Notification system to alert users/friend list about upcoming interested events, ticket availability, or any last-minute changes and to see which friends are interested in which events (accepted or declined).
- Allow users to seamlessly integrate event details with their Google Calendar app.
- Link to UTD maps for proper direction towards event location.
- OCR to extract text from posters and update event info

## Stretch Goals

- UTD SSO login
- Messaging option (to both friends and event organizer pages)
- Space within the app for users to discuss upcoming events, share experiences, and connect with fellow attendees.
- Feedback mechanism for users to rate and review events they attend.
- Integrate UTD hosted events as well
- Implement a recommendation system that suggests events based on users' preferences, past attendance, or interests.
- Include analytics tools to track user behavior, popular events, and engagement metrics.

## Milestones

<details>
  <summary>Week 1 (Build Night 1 – Dev Night 1)</summary>

  - Meet team.
  - Decide Frontend/Backend team.

  **Before Design Day**

  - Familiarize yourself with tech stack (link resources)
    - Frontend: Flutter
    - Backend: Flutter/Firebase

  **Design Day**

  - Setup:
    - Flutter
    - Android Studio
    - Create Firebase project.
    - Github repo
  - Brainstorm basic design layout

  **Tasks:**

  - Front-end:
    - Create low fidelity wireframes (Figma if familiar)
    - Learn Flutter (tutorials)
  - Firebase:
    - Learn Firebase 
    - Research Google Maps/ Google Cloud OCR

  **Dev Night 1:**

  - Troubleshoot github/flutter/firebase setup issues if any.
  - Meet mentors.
</details>

<details>
  <summary>Week 2 (Dev Night 1 – Build Night 2)</summary>

  **Team meeting**

  - Flesh out full vision of the App

  **Front-end:**

  - Learn Flutter
  - Show High fidelity Figma pages (as many pages as possible)
  - Start Coding Login Pages in Dart
  - Continue Figma pages (for other pages)

  **Backend:**

  - Learn Firebase
  - Set up a database to store user information.
  - Set up Firebase user authentication.
  - Set up a database design to store Organization poster/event objects.

  **Build Night 2:**

  **Front-end:**

  - Figma pages (complete core pages)
  - Login pages (implemented)

  **Back-end:**

  - User Authentication complete
  - Able to store user information in the database (user models created)
  - Show initial database design
</details>

<details>
  <summary>Week 3 (Build Night 2 – Dev Night 2)</summary>

  **Team meeting:**

  **Front-end and Backend Integration:**

  - User Auth Backend with Login Pages Frontend

  **Frontend:**

  - Finalize UI Design for all pages
  - Research how to upload/capture images in Flutter
  - Code core pages (Events display tab)

  **Back-end:**

  - Set up a database to store Organization poster/event objects
  - Research Firebase notifications/other notification options

  **Dev Night 2:**

  - Troubleshoot errors
  - Make up for delayed parts/edit design choices if needed.
</details>

<details>
  <summary>Week 4 (Dev Night 2 – Build Night 3)</summary>

  **Team meeting:**

  **Frontend:**

  - Finish Events tab
  - Start on Upcoming events tab for displaying registered events.

  **Back-end:**

  - Start Notification implementation.
  - Implement the ability to upload images and take pictures of posters to Firebase Storage
  - Research Google Maps/ UTD Maps Integration

  **Build Night 3:**

  **Front end:**

  - Events tab (complete)

  **Backend:**

  - Firebase storage set up (complete)
  - Discuss Notification System/Google maps
</details>

<details>
  <summary>Week 5/6 (Build Night 3 – Dev Night 3) SPRING BREAK</summary>

  **Team meeting:**

  - Address errors
  - Fix up missing tasks
  - Set clear expectations for the next week
  - Finish core features over break 😊
  - Integrate Firebase storage images with Events feed to pull up images from the database and show it in the events feed

  **Front-end:**

  - Interest “buttons”
  - User Avatars
  - Upcoming events tab for displaying registered events 
  - Friend’s tab for list of friends/search to add friends
  - Start editing the main events feed with other options:
    - Maps
    - Google calendar

  **Back-end:**

  - Notification system to alert users/friend list about upcoming interested events, ticket availability, or any last-minute changes and to see which friends are interested in which events (accepted or declined).
  - Allow users to seamlessly integrate event details with their Google Calendar app.
  - Link to UTD maps for proper direction towards event location.
  - Research OCR to extract text from posters and update event info

  **Full-stack:**

  - Research integration of Open AI for personalized event recommendations

  **Dev Night 3:**

  - Integrate Interest “buttons” with the Notification system
  - Google Calendar update/troubleshooting
  - UTD maps?
</details>

<details>
  <summary>Week 7 (Dev Night 3 – Build Night 4)</summary>

  - Backend and frontend communication to finish integrating backend with frontend to connect and test.
  - Polish up MVP
  - AI Update

  **Back-end:**

  - Google Calendar integration 
  - UTD Maps
  - OCR Update
</details>

<details>
  <summary>Week 8 (Build Night 4 – Dev night 4)</summary>

  - Finish Features
</details>

<details>
  <summary>Week 9 (Dev Night 4 – Build Night 5)</summary>

  - Work on Stretch goals/any last-minute troubleshooting
</details>

<details>
  <summary>Week 10 (Build Night 5 - Presentation Night)</summary>

  - Practice presentation
</details>


# Tech Stack

## Front-End: [Flutter](https://www.youtube.com/watch?v=8saLa5fh0ZI)

### Flutter Installation
Easy to learn, works on both macs and windows, good for mobile applications, contains helpful libraries as well

### Resources:
- [Flutter Basics](https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ)
- [Using Flutter w/ Firebase](https://firebase.google.com/docs/flutter/setup?platform=ios)
- [Taking Picture with Flutter](https://docs.flutter.dev/cookbook/plugins/picture-using-camera)
- [Flutter Docs](https://docs.flutter.dev/)
- [Implement OCR with Firebase Cloud Functions and Google Cloud Vision](https://www.youtube.com/watch?v=bTEU10c3gds)

## Back-End: Firebase
Easily compatible with Flutter, works well with Google Cloud OCR

### Resources: 
- [Using Flutter w/ Firebase](https://firebase.google.com/docs/flutter/setup?platform=ios)
- [Youtube Playlist: Flutter + Firebase](https://www.youtube.com/playlist?list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC)
- [Google Cloud OCR Documentation](https://cloud.google.com/vision/docs/ocr)
- [Google Cloud OCR + Flutter](https://firebase.google.com/docs/ml/android/recognize-text)
- [OCR Tutorial](https://cloud.google.com/functions/docs/tutorials/ocr)
- [Implement OCR with Firebase Cloud Functions and Google Cloud Vision](https://www.youtube.com/watch?v=bTEU10c3gds)
- [Introducing Firebase Notifications](https://www.youtube.com/watch?v=rTB7fTqMlS0)
- [Creating events in Google Calendar (100 Days of Google Dev)](https://www.youtube.com/watch?v=tNo9IoZMelI&t=353s)

### APIs
- [Google Calendar](https://developers.google.com/calendar/api/guides/overview)
- [Google cloud OCR](https://cloud.google.com/vision/docs/ocr)

## Software to Install

- [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- [Git](https://git-scm.com/downloads) (version control)
- [Flutter](https://docs.flutter.dev/get-started/editor) 
- [Firebase](https://firebase.google.com/docs/cli) 

## Roadblocks and Possible Solutions

- Difficult to implement the Google Cloud image OCR in the backend (Firebase)
  - There is a way to implement directly in Flutter
  - [Flutter Plugin to use Google Vision API](https://pub.dev/packages/google_ml_vision)
  - However, using the Google Cloud OCR in the backend is more accurate
  - [Read this article for more info](https://medium.com/dreamwod-tech/cloud-vision-vs-flutter-mlkit-for-ocr-detection-of-concept2-machine-514098f894af)

- Implementing accurate information into Google Calendar
- Handling multiple user types and corresponding user views: Organizations, Students, Friends

## Competition

- Posting event poster/updates on Instagram stories/posts to update followers (not as efficient since people may follow multiple accounts and that post may get lost/ having to check stories to see any updates)
- Hanging posters around campus(old school way)
- UTD app has events tab (only includes university hosted events)

## Other Resources

- [Git cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf)
- [Git in-depth tutorial](https://youtu.be/RGOj5yH7evk)
- [Postman set up tutorial](https://youtu.be/3eHJkcA8mTs)
- [Sharing any graphics using Box](https://utdallas.account.box.com/login)
- [Sign up for Figma](https://www.figma.com/signup)
- [Wireframe design inspiration](https://dribbble.com/shots/popular/web-design)
- Resources to make presentations:
  - [Pitch (more “professional” templates)](https://pitch.com/)
 
## Developers 👥
- Shruti Gupta 
- Seeyan Shabbar Gaus Newaz
- Dhruv Tripathi
- Charu Yuvaraja
- Sifat Islam

## Project Team
- Nadeeba Atiqui - Project Manager
- Sam Stegall - Industry Mentor

