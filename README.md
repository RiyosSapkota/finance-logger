# 💰 Finance Logger

> Log expenses in seconds via Telegram. AI categorizes them automatically. Get budget alerts and a beautiful dashboard.

<img width="1459" height="945" alt="image" src="https://github.com/user-attachments/assets/def1b946-98ce-4200-a1b4-6c3d2bb74fa9" />


---

## 🎯 What is this?

Most finance apps are too complicated. This one is just Telegram.

Send `50 shawarma dinner` → AI figures out it's Food → saves to database → done.

No apps to open. No forms to fill. Just message your bot.

---

## 📱 How it works

<img width="843" height="328" alt="image" src="https://github.com/user-attachments/assets/a6218eb0-4004-45b7-8d74-3d2bb562c7fd" />


**Log an expense:**
You: 15 breakfast office
Bot: ✅ Expense saved!
Amount: 50 AED | Category: Food | Description: shawarma dinner

**Check your spending:**
You: /summary
Bot: 📊 May 2026 Summary
Food: 180.20 AED
Groceries: 416.65 AED
Transport: 270.00 AED
...
💰 Total: 3,499.76 AED

**Made a mistake?**
You: /undo
Bot: ✅ Deleted last entry: 50 AED - Food - shawarma dinner

---

## ✨ Features

- 🤖 **AI Categorization** — Groq LLaMA automatically detects category from description
- 📊 **Monthly Summary** — `/summary` shows spending breakdown
- ⚠️ **Budget Alerts** — get warned at 80 AED and alerted at 100 AED weekly food spend
- 🚨 **Monthly Alerts** — pre-alert at 1,100 AED, main alert at 1,300 AED total
- 🔄 **Undo** — `/undo` deletes last entry instantly
- 📈 **Dashboard** — Metabase charts with donut, line and bar charts
- 🔒 **Private** — each user's data isolated by Telegram chat ID
- 👥 **Multi-user** — friends can use the same bot, data never mixes

---

## 🛠 Tech Stack

| Tool | Purpose | Cost |
|------|---------|------|
| n8n | Workflow automation | Free (self-hosted) |
| Groq AI | LLaMA 3.1 for categorization | Free |
| Supabase | PostgreSQL cloud database | Free |
| Metabase | Analytics dashboard | Free (self-hosted) |
| Telegram | User interface | Free |
| Docker | Container runtime | Free |
| ngrok | Webhook tunnel | Free |

**Total cost: $0/month** 🎉

---




## 🏗 Architecture

![Workflow] <img width="1445" height="688" alt="image" src="https://github.com/user-attachments/assets/9fac447d-60b5-49ed-9396-162fc4237a85" />
```
Telegram Message
       ↓
   n8n Webhook
       ↓
  Switch Node
  ┌────┴────┐
  │         │
/summary  Expense
  │         │
  │      Groq AI
  │         │
  │      Supabase
  │         │
  └────┬────┘
       ↓
  Telegram Reply
  + Budget Alert
```

## 📊 Dashboard

![Dashboard]<img width="1383" height="941" alt="image" src="https://github.com/user-attachments/assets/81beba6a-0923-43e8-82bf-fae815ebbd9d" />


Built with Metabase showing:
- 🍩 Expenses by category (donut chart)
- 📈 Daily spending timeline (line chart)  
- 📊 Last 30 days by category (bar chart)

---

## 🚀 Setup Guide

### Prerequisites
- Docker Desktop installed
- ngrok account (free at ngrok.com)
- Groq API key (free at console.groq.com)
- Telegram bot token (create via @BotFather)
- Supabase account (free at supabase.com)

### Step 1 — Clone
```bash
git clone https://github.com/YOUR_USERNAME/finance-logger.git
cd finance-logger
```

### Step 2 — Start Docker services
```bash
docker compose up -d
```

This starts:
- n8n at `http://localhost:5678`
- Metabase at `http://localhost:3000`

### Step 3 — Create database
Run in Supabase SQL Editor:
```sql
CREATE TABLE expenses (
  id SERIAL PRIMARY KEY,
  amount DECIMAL(10,2),
  category VARCHAR(50),
  description TEXT,
  chat_id BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Step 4 — Import workflow
- Open `http://localhost:5678`
- Go to Workflows → Import
- Upload `workflow.json`
- Add your credentials:
  - Telegram bot token
  - Groq API key
  - Supabase connection details

### Step 5 — Start ngrok
```bash
ngrok http 5678
```

Update the webhook URL in your n8n workflow with the ngrok URL.

### Step 6 — Start using!
Message your Telegram bot:
50 shawarma dinner

---

## 💬 Commands

| Command | Description |
|---------|-------------|
| `[amount] [description]` | Log an expense |
| `/summary` | Monthly spending by category |
| `/undo` | Delete last entry |
| `/report` | Get dashboard link |

---

## 🔒 Privacy & Security

- Each user identified by unique Telegram `chat_id`
- No user can access another user's data
- API keys stored in n8n credentials (encrypted)
- Database hosted on Supabase with SSL

---

## 📈 Roadmap

- [ ] Income tracking
- [ ] Loan tracking  
- [ ] Weekly digest (automated every Sunday)
- [ ] Receipt photo scanning
- [ ] Oracle Cloud hosting (always online)
- [ ] Web dashboard accessible from phone

---

## 🤝 Try it yourself

👉 **Telegram Bot:** [t.me/riyos_finance_bot](https://t.me/riyos_finance_bot)

---

## 📝 License

MIT — free to use, modify and distribute.

---

<div align="center">
Built with ❤️ by <a href="https://github.com/RiyosSapkota">Riyos</a>
<br>
⭐ Star this repo if you find it useful!
</div>
