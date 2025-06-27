const express = require('express');
const app = express();
const PORT = process.env.PORT || 4000;
app.use(express.json());
app.get('/', (req, res) => {
  res.send('Rehearsal Scheduler API');
});
// API implementation for bookings, users, studios, etc. goes here
app.listen(PORT, () => console.log(`API running on port ${PORT}`));
