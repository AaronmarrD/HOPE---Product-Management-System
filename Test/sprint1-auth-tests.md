# Sprint 1 QA Test Cases

## Module: Authentication System

---

| Test ID | Feature        | Test Scenario                   | Steps                                                     | Expected Result                                | Actual Result | Status |
| ------- | -------------- | ------------------------------- | --------------------------------------------------------- | ---------------------------------------------- | ------------- | ------ |
| TC-001  | Register       | Register new user using email   | Open register page → Enter valid details → Click Register | User account should be created successfully    |               | ⬜      |
| TC-002  | Login          | Login with valid email/password | Open login page → Enter valid credentials → Click Login   | User should login and redirect to dashboard    |               | ⬜      |
| TC-003  | Login          | Login with incorrect password   | Enter wrong password                                      | System should show invalid credentials message |               | ⬜      |
| TC-004  | Google OAuth   | Login using Google account      | Click Google Login button                                 | User should authenticate successfully          |               | ⬜      |
| TC-005  | Access Control | INACTIVE user login             | Login using inactive account                              | System should deny access                      |               | ⬜      |
| TC-006  | Access Control | ACTIVE user login               | Login using active account                                | System should allow access                     |               | ⬜      |

---

# QA Notes

* Authentication routes tested locally
* Supabase authentication integration verified
* OAuth redirect behavior checked

---

# Bugs Found

| Bug ID | Description          | Severity | Status |
| ------ | -------------------- | -------- | ------ |
| None   | No bugs reported yet | -        | -      |

---

# Tester Information

| Tester    | Role                          |
| --------- | ----------------------------- |
| Rhoben Echaluse | QA / Documentation Specialist |
