# MindCalc 🧠➕

**Mental Math Challenge Game (Java Servlet)**

MindCalc is a browser-based mental arithmetic game built using Java Servlets and JSP. Players solve addition problems that increase in difficulty across multiple levels.

---

## How It Works

1️⃣ Each request to `/gameServlet` generates a new question.

2️⃣ The game:

* Randomly generates **3 numbers**
* Calculates their sum
* Generates **3 random wrong options**
* Shuffles all 4 options (1 correct + 3 incorrect)

3️⃣ The correct answer is placed randomly among:

```
first | second | third | fourth
```

4️⃣ Question number (`QNo`) controls difficulty level.

---

## Difficulty Levels

| Level   | Question No | Number Range |
| ------- | ----------- | ------------ |
| Level 1 | 1–10        | 0–50         |
| Level 2 | 11–20       | 0–100        |
| Level 3 | 21–30       | 0–500        |
| Level 4 | 31–40       | 0–1000       |
| Level 5 | 41–50       | 0–10000      |

As levels increase:

* Numbers become larger
* Wrong answer range increases
* Mental calculation difficulty increases

---

## Game Flow

```
Request → Generate Numbers → Calculate Sum
        → Generate Wrong Options
        → Shuffle Options
        → Forward to game.jsp
```

---

## Tech Stack

* Java Servlet (Jakarta EE)
* JSP
* Random number generation
* RequestDispatcher forwarding

---

## Features

* 5 progressive difficulty levels
* Randomized answer placement
* Dynamic question generation
* Simple servlet-based game logic

---

MindCalc demonstrates dynamic content generation, difficulty scaling, and servlet-to-JSP request handling in a Java web application.

