# -2024-Q1-Showcase-Multi-Task-Manager

Repos containing some scripts and showcase videos for Multi-Task Manager.

Multi-Task Manager is a multi-window game that tests one's ability to multitask by playing multiple games at once. This game is also a commment on the future generation's ever-decreasing attention spans with the prevalence of "short-form content" on YouTube and Tiktok, referring to video collages with multiple simultaneously-playing videos meant to keep the consumer entertained.

This Showcase contains 5 "Modules", or mini game windows. Multiple similar or different Modules can be loaded at once, adding an extra layer of concentration and difficulty with each Module added. Modules also have an added "difficulty" Module, which changes how easy or difficult each Module's mechanic is. The Modules showcased are:
Basic Module
-A simple module to demonstrate basic loading and running of Modules.

Position Module
-This Module is similar to a basic module, except its position relative to the display is shown within the Module. This Module demonstrates the ability to detect the position of the window, even when manually moved by the player.

Persistent Timer Module
-A Module that "persists" for a long time, and only terminates when you "lose" its minigame or you stop Multi-Task Manager manually. It has a timer that counts down, which can be "winded" back up, increasing its run-time. You "lose" its minigame if the time runs out, or you "overwind" it, exceeding the time limit.

Clock Module
-A Module that displays a randomised date. In order to close this module, you have to imput the correct day of the week that corresponds to the date. A higher difficulty will generate a date further away from the current date (based on the system clock)

Concentration 32
-Inspired by the playground game "Concentration 64", where players take turns to say a valid word without repeating a word already said, this Module pulls from a database of words and either displays a new word, or repeats a word already displayed. The player has to identify whether a word has been repeated or if it is original, by pressing the "Sure" and "Nope" buttons respectively. Points are gained for correct guesses while points are deducted for incorrect guesses. The Module closes when the point count reaches a certain number. A higher difficulty will result in a higher point requirement.

The showcase video shows how these 5 Modules work, as well as showcasing how these modules will be imported and ran.