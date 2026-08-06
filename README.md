# SAP-RAP-Loan-Approval-System
RESTful ABAP Programming Model (RAP) Loan Approval Application

# 🏛️ SAP RAP Managed Loan Approval System

An end-to-end enterprise Loan Approval application developed using the **RESTful ABAP Programming Model (RAP)** on SAP S/4HANA / ABAP Cloud.

---
## 📁 Repository Architecture & Folder Structure

```text
SAP-RAP-Loan-Approval-System
│
├── README.md                      # Project landing page & technical overview
│
├── OUTPUT_IMAGES/                 # Application screenshots & architecture diagrams
│   ├── Architecture.png           # Layered RAP architectural diagram
│   ├── HOME.png                   # List Report app home screen
│   ├── FIELDS.png                 # Object Page creation form & field inputs
│   └── Eligibility_Check_Result.png # Validation & dynamic eligibility check output
│
├── Project_Explanation.txt        # Complete end-to-end functional & technical documentation
│
└── Source_Code/                   # ABAP artifacts & RAP code snippets
    ├── zloan_master.tabl.abap     # Primary database table (zloan_master)
    ├── ZI_LOAN_MASTER.asddls.abap # Data model interface view CDS
    ├── ZC_LOAN_MASTER.asddls.abap # Transactional projection view CDS
    ├── ZI_LOAN_MASTER.bdef.abap   # Managed behavior definition (BDEF)
    ├── ZXM_LOAN_MASTER.asdx       # CDS metadata extension (UI annotations)
    └── zbp_i_loan_master_v2.clas.abap # Behavior implementation class
