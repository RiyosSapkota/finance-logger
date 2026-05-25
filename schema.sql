CREATE TABLE expenses (
  id SERIAL PRIMARY KEY,
  amount DECIMAL(10,2),
  category VARCHAR(50),
  description TEXT,
  chat_id BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for faster queries by chat_id
CREATE INDEX idx_expenses_chat_id ON expenses(chat_id);

-- Index for date-based queries
CREATE INDEX idx_expenses_created_at ON expenses(created_at);