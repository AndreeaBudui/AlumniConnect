#AlumniConnect - Full-Stack Web Application

**AlumniConnect** is a modern information system designed to bridge the gap between university graduates and their alma mater. 
Developed as a **Bachelor's Thesis** at the Faculty of Economics and Business Administration (**FEAA**), UAIC, the platform facilitates networking, career support, and continuous community engagement. 

---

##  Tech Stack & Implementation
The application architecture is built on a robust set of technologies to ensure a dynamic and responsive user experience: 

**Backend:** **PHP**.Used for server-side logic, session management, and secure form processing via the `POST` method.
**Database:** **PostgreSQL**.A relational database managed via **pgAdmin 4**, featuring a complex schema for users, forum interactions, events, and donations. 
**Frontend:** **HTML5**, **CSS3**, and **JavaScript**.These core technologies enable a structured, styled, and interactive interface.
**Data Visualization:** **Chart.js**. Integrated to provide real-time statistical insights into career trends and top companies within the network. 
**Tools & Libraries:** Developed using **Visual Studio Code** and tested in a local **XAMPP** environment (**Apache** server). Icons are provided by **Font Awesome**.

---

##  Key Features
**User Authentication:** Secure registration and login system. Passwords are encrypted using the `password_hash()` function to ensure data security. 
**Interactive Forum:** A dedicated space for community discussion, allowing users to post questions and engage through real-time comments. 
**Career Module:** Includes a job board and a visual dashboard displaying top 5 employers and roles among the alumni community. 
**Donation System:** A functional module where members can financially support academic initiatives through a processed donation form. 
**Personalized Profiles:** Users can manage their contact details, academic background, and current professional status. 
**Event Management:** An organized display of alumni reunions, workshops, and conferences.

---

##  Software Quality Standards
The system's design and evaluation are based on the **ISO/IEC 25010** international standard. The project focuses on key quality sub-characteristics: 

**Functional Suitability:** Ensuring all user requirements and tasks are fully met. 
**Performance Efficiency:** Optimized for fast response times and efficient resource utilization. 
**Usability:** Featuring an intuitive design and easy navigation for a seamless user experience. 

---

## ⚙️ How to Run
1. **Database Setup:** Import the `LicentaMea.sql` file into your **PostgreSQL** environment (**pgAdmin 4** or **DBeaver**) to recreate the relational schema. 
2. **Configuration:** Configure the database connection parameters in the `bazaDeDate.php` file. [cite: 693]
3. **Deployment:** Place the project folder in your local server directory (e.g., `htdocs` for **XAMPP** or `www` for **Laragon**) and access it via a web browser. 
