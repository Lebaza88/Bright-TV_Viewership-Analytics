# Bright-TV_Viewership-Analytics
BrightTV’s CEO aims to increase the company’s subscription base in the current financial year

## Objective (as per Case Study Brief)

Deliver insights that help grow BrightTV’s subscription base by answering:
- What are the key **user and usage trends**?
- What **factors influence consumption**?
- What **content** should be recommended on low-consumption days?
- What **initiatives** can further grow the user base?

**Note:** All timestamps were converted from UTC to South Africa time (SAST).

---

## Tools Used

| Category              | Tools Used                          |
|-----------------------|-------------------------------------|
| Project Planning      | Miro                                |
| Data Processing       | Databricks + SQL                    |
| Analysis & Visualization | Microsoft Excel (Pivot Tables & Charts) |
| Presentation          | Microsoft PowerPoint                |
| Version Control       | GitHub                              |

---

## Methodology Summary

**Task 1 – Planning & Architecture (Miro)**  
- Designed full **Data Flow & Architecture Diagram** (Source → Processing → Analysis → Presentation)  
- Identified key deliverables aligned with CEO objectives

**Task 2 – Data Processing**  
- Loaded raw user profiles and transaction data  
- Converted all UTC timestamps to South Africa time (SAST)  
- Created new columns for day-of-week, hour, session duration, and consumption trends  
- Cleaned and prepared data for analysis

**Task 3 – Data Analysis in Excel**  
- Built interactive Pivot Tables and Charts showing:  
  - User & usage trends  
  - Factors influencing consumption  
  - Low-consumption days and content opportunities  
  - Growth opportunities

**Task 4 – CEO Presentation**  
- 20-minute executive presentation with clear visuals and recommendations  
- Separate Methodology document

---

## Key Insights (Summary)

Full detailed insights and charts are available in `presentation/CEO_Presentation.pptx` and `insights/Key_Insights_Summary.md`.

**Highlights include:**
- Clear user behaviour patterns by time of day and day of week  
- Factors that drive higher consumption (content type, device, session length)  
- Specific days/times with low viewership  
- High-potential content recommendations for low-consumption periods

---

## Recommendations for the CEO

1. **Content Strategy** – Promote specific content types on low-consumption days  
2. **Targeted Marketing** – Run campaigns during peak usage hours and for low-engagement segments  
3. **User Growth Initiatives** – Loyalty programs, personalised recommendations, and acquisition campaigns  
4. **Operational Improvements** – Optimise content scheduling and platform features based on usage trends

---

## Next Steps (Suggested)

- Automate weekly viewership reports  
- Integrate real-time analytics for faster decision-making  
- Expand analysis to include subscriber churn and retention metrics

---

## How to Explore This Repo

1. Start with `README.md`  
2. View Miro diagram for architecture  
3. Open `data/processed/BrightTV_Processed_Data.xlsx` for interactive Pivot Tables & Charts  
4. Review `sql/analysis_queries.sql` for reproducible code  
5. Open `presentation/CEO_Presentation.pptx` for the final 20-minute deck

---

**Project completed as per the official BrightTV Case Study brief.**  



**Author:** Itumeleng (Junior Data Analyst)  
