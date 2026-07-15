# System Architecture

**Version:** 1.0.0  
**Status:** Draft

## Logical Layers

1. Presentation Layer
2. Session and Journal Service
3. Program Import Service
4. Data Normalization Layer
5. Persistence Layer
6. Observation and Analysis Layer
7. Media Storage Layer

## Conceptual Flow

User Input  
→ Context Assignment  
→ Validation  
→ Structured Storage  
→ Historical Comparison  
→ Observation Generation  
→ User Review

## Architectural Principle

Raw observations must remain available even after derived summaries change. Derived conclusions should never replace source data.
