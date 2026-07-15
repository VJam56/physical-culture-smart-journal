# Data Relationships

- One user has many programs.
- One program has many training days.
- One training day has many exercise prescriptions.
- One session references one training day, unless manually created.
- One session has many performed sets.
- One performed set can have many journal entries.
- One session can have one or more recovery, nutrition, supplement, and body-metric references.
- Journal entries preserve sequence order.
- Media is linked through a journal entry and inherits session and set context.
