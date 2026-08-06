# SAP-RAP-Loan-Approval-System
RESTful ABAP Programming Model (RAP) Loan Approval Application


# 🏦 SAP RAP Managed Loan Approval System

An end-to-end enterprise Loan Approval application developed using the **RESTful ABAP Programming Model (RAP)** on SAP S/4HANA / ABAP Cloud.

---

## 📂 Repository Architecture & Folder Structure

```text
SAP-RAP-Loan-Approval-System
│
├── README.md                  # Project landing page & technical overview
│
├── Documentation/            # System design & execution flows
│   ├── Architecture.png       # Layered RAP architectural diagram
│   ├── Database.png           # Database table schema (zloan_master)
│   └── RAP Flow.png           # Execution lifecycle (UI to Handler)
│
├── Screenshots/              # Fiori Elements UI walkthrough
│   ├── Home.png               # List Report app home screen
│   ├── Create Loan.png        # Object Page creation form
│   ├── Approved Loan.png      # Approved status output
│   └── Rejected Loan.png      # Validation & rejection error state
│
├── Project Explanation.pdf    # Complete end-to-end functional & technical PDF guide
│
└── Source_Code/              # ABAP artifacts & RAP code snippets
    ├── Tables.txt             # Data dictionary definition (zloan_master)
    ├── CDS.txt                # Interface & Projection CDS Views
    ├── Behavior.txt           # Managed Behavior Definitions (BDEF)
    ├── DCL.txt                # Data Control Language / Access Control
    └── Classes.txt            # Behavior Implementation Class (zbp_i_loan_master_v2)
