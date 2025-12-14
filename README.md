![logo](https://github.com/ardavan8102/dotbook/blob/main/assets/brand/github_wide_logo.png?raw=true)

# DotBook | Epub Reader

Application for reading and opening epub book files.

## 📚 Things i learned and dealt with

In this project, the first challenge was how to find an epub file from memory and display it in the UI; this was just the beginning, and then I moved on to the main challenge, the epub rendering engine. Since processing and loading epub is a heavy, main-threaded operation, we had freezes and bugs in the UI, which I solved by isolating the epub loading structure. I used the MVC architecture.


## 💻 Tech Stack

**Client:** Dart, Flutter

Packages :

```diff
! epubx

! permission_handler

! path_provider

! flutter_widget_from_html

! get
```


## 💫 Features

- Search Automatically for .epub files in device
- Isolated and Smooth ui


## 📧 Feedback

If you have any feedback, please reach out to us at ardavaneskandari007@gmail.com
## 🔒 License

[Licensed by MIT For Ardavan Eskandari](https://choosealicense.com/licenses/mit/)