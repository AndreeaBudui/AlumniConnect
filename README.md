# [cite_start]AlumniConnect - Full-Stack Web Application [cite: 35, 628]

[cite_start]**AlumniConnect** is a modern information system designed to bridge the gap between university graduates and their alma mater. [cite: 630, 688] [cite_start]Developed as a **Bachelor's Thesis** at the Faculty of Economics and Business Administration (**FEAA**), UAIC, the platform facilitates networking, career support, and continuous community engagement. [cite: 33, 44, 631, 632]

---

## 🛠️ Tech Stack & Implementation
[cite_start]The application architecture is built on a robust set of technologies to ensure a dynamic and responsive user experience: [cite: 690]

* **Backend:** **PHP**. [cite_start]Used for server-side logic, session management, and secure form processing via the `POST` method. [cite: 693, 762]
* **Database:** **PostgreSQL**. [cite_start]A relational database managed via **pgAdmin 4**, featuring a complex schema for users, forum interactions, events, and donations. [cite: 660, 682, 694]
* **Frontend:** **HTML5**, **CSS3**, and **JavaScript**. [cite_start]These core technologies enable a structured, styled, and interactive interface. [cite: 691]
* **Data Visualization:** **Chart.js**. [cite_start]Integrated to provide real-time statistical insights into career trends and top companies within the network. [cite: 692, 707]
* **Tools & Libraries:** Developed using **Visual Studio Code** and tested in a local **XAMPP** environment (**Apache** server). [cite_start]Icons are provided by **Font Awesome**. [cite: 692, 695, 698]

---

## 🚀 Key Features
* **User Authentication:** Secure registration and login system. [cite_start]Passwords are encrypted using the `password_hash()` function to ensure data security. [cite: 643, 711, 764]
* [cite_start]**Interactive Forum:** A dedicated space for community discussion, allowing users to post questions and engage through real-time comments. [cite: 649, 701, 886]
* [cite_start]**Career Module:** Includes a job board and a visual dashboard displaying top 5 employers and roles among the alumni community. [cite: 704, 707, 835]
* [cite_start]**Donation System:** A functional module where members can financially support academic initiatives through a processed donation form. [cite: 646, 708, 865]
* [cite_start]**Personalized Profiles:** Users can manage their contact details, academic background, and current professional status. [cite: 643, 739, 740, 832]
* [cite_start]**Event Management:** An organized display of alumni reunions, workshops, and conferences. [cite: 644, 701]

---

## 📊 Software Quality Standards
[cite_start]The system's design and evaluation are based on the **ISO/IEC 25010** international standard. [cite: 290, 941] [cite_start]The project focuses on key quality sub-characteristics: [cite: 353, 941]

* [cite_start]**Functional Suitability:** Ensuring all user requirements and tasks are fully met. [cite: 293, 294, 658]
* [cite_start]**Performance Efficiency:** Optimized for fast response times and efficient resource utilization. [cite: 303, 305, 309, 652]
* [cite_start]**Usability:** Featuring an intuitive design and easy navigation for a seamless user experience. [cite: 316, 633, 656]

---

## ⚙️ How to Run
1. [cite_start]**Database Setup:** Import the `LicentaMea.sql` file into your **PostgreSQL** environment (**pgAdmin 4** or **DBeaver**) to recreate the relational schema. [cite: 682]
2. [cite_start]**Configuration:** Configure the database connection parameters in the `bazaDeDate.php` file. [cite: 693]
3. [cite_start]**Deployment:** Place the project folder in your local server directory (e.g., `htdocs` for **XAMPP** or `www` for **Laragon**) and access it via a web browser. [cite: 695]
